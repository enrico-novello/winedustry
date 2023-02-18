package repository.datasource.ordine;


import entities.ordine.Pagamento;
import repository.DataSourceJPA;

public class PagamentoJPA extends DataSourceJPA<Pagamento, Integer> {
    public PagamentoJPA() {
        super(Pagamento.class);
    }
}
