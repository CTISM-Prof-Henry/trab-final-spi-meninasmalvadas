package br.cspi.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

public class Usuario {
    @Id
    private int id;

    @NonNull
    private String nome;
    @NonNull
    private String email;
    @NonNull
    private String senha;
    private boolean ativo;




}




