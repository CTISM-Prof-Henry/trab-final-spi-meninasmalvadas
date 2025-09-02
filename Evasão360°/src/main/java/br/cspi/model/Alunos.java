package br.cspi.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.time.LocalDate;

@Entity
public class Alunos {
    @Id
    private int id;
    private String matricula;
    private String nome;
    private String curso;
    private double risco;
    private String email;
    private String cpf;
    private LocalDate nascimento;
    private String telefone;
    private String endereco;
    private double frequencia;
    private double media;
}
