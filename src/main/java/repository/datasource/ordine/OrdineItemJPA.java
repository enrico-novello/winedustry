package repository.datasource.ordine;

import entities.ordine.OrdineItem;
import repository.DataSourceJPA;

public class OrdineItemJPA extends DataSourceJPA<OrdineItem, Integer>{
    public OrdineItemJPA() {
        super(OrdineItem.class);
    }
}
