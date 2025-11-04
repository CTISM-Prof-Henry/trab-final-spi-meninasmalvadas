package br.cspi.controller;

import br.cspi.dao.CursoDAO;
import br.cspi.model.Alunos;
import br.cspi.model.Centros;
import br.cspi.model.Cursos;
import br.cspi.model.Usuario;
import br.cspi.service.AlunoService;
import br.cspi.service.CentroService;
import br.cspi.service.CursoService;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@AllArgsConstructor
public class RelatorioController {

    private final AlunoService alunoService;
    private final CursoService cursoService;
    private final CentroService centroService;

    @GetMapping("/relatorios")
    public String viewRelatorios(@RequestParam(required = false, defaultValue = "-1") Integer centroId,
                                 @RequestParam(required = false, defaultValue = "-1") Integer cursoId,
                                 HttpSession session,
                                 Model model) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        System.out.println(usuario.getId() + " - " + usuario.getNome() + " - " + usuario.getPermissao());

        if (usuario.getPermissao() == Usuario.tipo_permissao.GERAL) {

            ArrayList<Centros> centros = this.centroService.getCentros();
            model.addAttribute("centros", centros);


            List<Cursos> cursos = Collections.emptyList();
            if (centroId > -1) {
                cursos = this.cursoService.getCursosbyCentro(centroId);
            }
            model.addAttribute("cursos", cursos);
        } else if (usuario.getPermissao() == Usuario.tipo_permissao.CENTRO) {

            ArrayList<Centros> centros = this.centroService.getCentro(usuario.getCentro_id());
            model.addAttribute("centros", centros);
            centroId = usuario.getCentro_id();


            List<Cursos> cursos = Collections.emptyList();
            if (centroId > -1) {
                cursos = this.cursoService.getCursosbyCentro(centroId);
            }
            model.addAttribute("cursos", cursos);
        } else if (usuario.getPermissao() == Usuario.tipo_permissao.CURSO) {

            List<Cursos> cursos = Collections.emptyList();
            if (usuario.getCurso_id() > -1) {
                cursos = this.cursoService.getCursosbyId(usuario.getCurso_id());
                cursoId = usuario.getCurso_id();
            }
            model.addAttribute("cursos", cursos);

        }

        List<Alunos> alunos = Collections.emptyList();

        if (cursoId > -1) {
            alunos = this.alunoService.getAlunosByCurso(cursoId);


        } else if (centroId > -1) {
            alunos = this.alunoService.getAlunosByCentro(centroId);


        } else if (centroId == -1 && cursoId == -1) {

            if (usuario.getPermissao() == Usuario.tipo_permissao.GERAL) {
                alunos = this.alunoService.getAlunos();

            } else if (usuario.getPermissao() == Usuario.tipo_permissao.CENTRO) {
                alunos = this.alunoService.getAlunosByCentro(usuario.getCentro_id());

            } else if (usuario.getPermissao() == Usuario.tipo_permissao.CURSO) {
                alunos = this.alunoService.getAlunosByCurso(usuario.getCurso_id());
            }
        }

        List<Cursos> cursos = new CursoService(new CursoDAO()).getCursos();
        //retorna relatorios.jsp

        model.addAttribute("alunos", alunos);

        // passa os IDs para o JSP
        model.addAttribute("permissao", usuario.getPermissao());
        model.addAttribute("centroSelecionadoId", centroId);
        model.addAttribute("cursoSelecionadoId", cursoId);
        model.addAttribute("centroId", centroId);
        model.addAttribute("cursoId", cursoId);
        return "relatorios";
    }


    @GetMapping("/relatorioByCurso/{id}")
    public void gerarRelatorioByCurso(HttpServletResponse response, HttpSession session,
                               @PathVariable int id) throws IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=relatorio.pdf");

        List<Alunos> alunosbase = alunoService.getAlunosByCurso(id);
        List<Alunos> alunos = alunoService.getAlunosbyRisco(alunosbase);


        try {

            Document document = new Document(PageSize.A4, 50, 50, 60, 60);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Fonte de título principal
            Font fontTitulo = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font fontSubtitulo = new Font(Font.HELVETICA, 12, Font.BOLD);
            Font fontTexto = new Font(Font.HELVETICA, 10, Font.NORMAL);
            Font fontTexto2 = new Font(Font.HELVETICA, 12, Font.NORMAL, Color.WHITE);

            // Título centralizado
            Paragraph titulo = new Paragraph("Alto Risco de Evasão UFSM", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);
            Paragraph Data = new Paragraph(("Data: " + LocalDate.now()));
            Data.setAlignment(Element.ALIGN_CENTER);

            document.add(new Paragraph(" ")); // espaço
            document.add(Data);
            document.add(new Paragraph(" ")); // espaço

            // INTRODUÇÃO
            document.add(new Paragraph("Introdução", fontSubtitulo));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("        Listagem analítica de alunos classificados com alto risco de evasão, elaborada a partir dos dados acadêmicos coletados.", fontTexto));
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100); // usa toda a largura disponível
            table.setWidths(new float[]{1f, 1.5f, 1.5f, 2f});

            String[] headers = {"Matricula", "Nome", "Curso", "Email"};

            for (String header : headers) {
                PdfPCell headerCell = new PdfPCell();
                headerCell.setBackgroundColor(Color.DARK_GRAY);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerCell.setPadding(8);
                headerCell.setPhrase(new Phrase(header, fontTexto2));
                table.addCell(headerCell);
            }
            List<String[]> dados = new ArrayList<>();
            for (Alunos aluno : alunos) {
                dados.add(new String[]{
                        String.valueOf(aluno.getMatricula()),
                        aluno.getNome(),
                        aluno.getCursoNome(),
                        aluno.getEmail()
                });

            }
            int rowCount = 0;
            for (String[] linha : dados) {


                for (String valor : linha) {
                    PdfPCell cell = new PdfPCell(new Phrase(valor, fontTexto));
                    if (rowCount % 2 == 0) {
                        cell.setBackgroundColor(Color.white);
                    } else {
                        cell.setBackgroundColor(Color.LIGHT_GRAY);
                    }
                    cell.setPadding(6);
                    table.addCell(cell);
                }
                rowCount++;
            }


            document.add(table);
            
            document.close();

        } catch (DocumentException e) {
            throw new IOException(e);
        }
    }


    @GetMapping("/relatorioByCentro/{id}")
    public void gerarRelatorioByCentro(HttpServletResponse response, HttpSession session,
                               @PathVariable int id) throws IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=relatorio.pdf");

        List<Alunos> alunosbase = alunoService.getAlunosByCentro(id);
        List<Alunos> alunos = alunoService.getAlunosbyRisco(alunosbase);


        try {

            Document document = new Document(PageSize.A4, 50, 50, 60, 60);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Fonte de título principal
            Font fontTitulo = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font fontSubtitulo = new Font(Font.HELVETICA, 12, Font.BOLD);
            Font fontTexto = new Font(Font.HELVETICA, 10, Font.NORMAL);
            Font fontTexto2 = new Font(Font.HELVETICA, 12, Font.NORMAL, Color.WHITE);

            // Título centralizado
            Paragraph titulo = new Paragraph("Alto Risco de Evasão UFSM", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);
            Paragraph Data = new Paragraph(("Data: " + LocalDate.now()));
            Data.setAlignment(Element.ALIGN_CENTER);

            document.add(new Paragraph(" ")); // espaço
            document.add(Data);
            document.add(new Paragraph(" ")); // espaço

            // INTRODUÇÃO
            document.add(new Paragraph("Introdução", fontSubtitulo));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("        Listagem analítica de alunos classificados com alto risco de evasão, elaborada a partir dos dados acadêmicos coletados.", fontTexto));
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100); // usa toda a largura disponível
            table.setWidths(new float[]{1f, 1.5f, 1.5f, 2f});

            String[] headers = {"Matricula", "Nome", "Curso", "Email"};

            for (String header : headers) {
                PdfPCell headerCell = new PdfPCell();
                headerCell.setBackgroundColor(Color.DARK_GRAY);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerCell.setPadding(8);
                headerCell.setPhrase(new Phrase(header, fontTexto2));
                table.addCell(headerCell);
            }
            List<String[]> dados = new ArrayList<>();
            for (Alunos aluno : alunos) {
                dados.add(new String[]{
                        String.valueOf(aluno.getMatricula()),
                        aluno.getNome(),
                        aluno.getCursoNome(),
                        aluno.getEmail()
                });

            }
            int rowCount = 0;
            for (String[] linha : dados) {


                for (String valor : linha) {
                    PdfPCell cell = new PdfPCell(new Phrase(valor, fontTexto));
                    if (rowCount % 2 == 0) {
                        cell.setBackgroundColor(Color.white);
                    } else {
                        cell.setBackgroundColor(Color.LIGHT_GRAY);
                    }
                    cell.setPadding(6);
                    table.addCell(cell);
                }
                rowCount++;
            }


            document.add(table);

            document.close();

        } catch (DocumentException e) {
            throw new IOException(e);
        }
    }

    @GetMapping("/relatorioGeral")
    public void gerarRelatorioGeral(HttpServletResponse response, HttpSession session
                                       ) throws IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=relatorio.pdf");

        List<Alunos> alunosbase = alunoService.getAlunos();
        List<Alunos> alunos = alunoService.getAlunosbyRisco(alunosbase);


        try {

            Document document = new Document(PageSize.A4, 50, 50, 60, 60);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Fonte de título principal
            Font fontTitulo = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font fontSubtitulo = new Font(Font.HELVETICA, 12, Font.BOLD);
            Font fontTexto = new Font(Font.HELVETICA, 10, Font.NORMAL);
            Font fontTexto2 = new Font(Font.HELVETICA, 12, Font.NORMAL, Color.WHITE);

            // Título centralizado
            Paragraph titulo = new Paragraph("Alto Risco de Evasão UFSM", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);
            Paragraph Data = new Paragraph(("Data: " + LocalDate.now()));
            Data.setAlignment(Element.ALIGN_CENTER);

            document.add(new Paragraph(" ")); // espaço
            document.add(Data);
            document.add(new Paragraph(" ")); // espaço

            // INTRODUÇÃO
            document.add(new Paragraph("Introdução", fontSubtitulo));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("        Listagem analítica de alunos classificados com alto risco de evasão, elaborada a partir dos dados acadêmicos coletados.", fontTexto));
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100); // usa toda a largura disponível
            table.setWidths(new float[]{1f, 1.5f, 1.5f, 2f});

            String[] headers = {"Matricula", "Nome", "Curso", "Email"};

            for (String header : headers) {
                PdfPCell headerCell = new PdfPCell();
                headerCell.setBackgroundColor(Color.DARK_GRAY);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerCell.setPadding(8);
                headerCell.setPhrase(new Phrase(header, fontTexto2));
                table.addCell(headerCell);
            }
            List<String[]> dados = new ArrayList<>();
            for (Alunos aluno : alunos) {
                dados.add(new String[]{
                        String.valueOf(aluno.getMatricula()),
                        aluno.getNome(),
                        aluno.getCursoNome(),
                        aluno.getEmail()
                });

            }
            int rowCount = 0;
            for (String[] linha : dados) {


                for (String valor : linha) {
                    PdfPCell cell = new PdfPCell(new Phrase(valor, fontTexto));
                    if (rowCount % 2 == 0) {
                        cell.setBackgroundColor(Color.white);
                    } else {
                        cell.setBackgroundColor(Color.LIGHT_GRAY);
                    }
                    cell.setPadding(6);
                    table.addCell(cell);
                }
                rowCount++;
            }


            document.add(table);

            document.close();

        } catch (DocumentException e) {
            throw new IOException(e);
        }
    }
}


