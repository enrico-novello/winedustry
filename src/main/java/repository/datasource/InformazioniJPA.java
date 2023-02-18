package repository.datasource;

import entities.Informazioni;
import repository.DataSourceJPA;

public class InformazioniJPA extends DataSourceJPA<Informazioni, Integer> {

    public InformazioniJPA() {
        super(Informazioni.class);
    }
}
