package repository.datasource;


import entities.Indirizzo;
import repository.DataSourceJPA;

public class IndirizzoJPA extends DataSourceJPA<Indirizzo, Integer> {

    public IndirizzoJPA() {
        super(Indirizzo.class);
    }
}
