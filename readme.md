# Práctica TDD online
Los test de los objetos *Money* y *Broker* son los mismos que en el curso. 

##Test del Data source
Tus **tests del data source** de la tabla deben de cubrir los siguientes hechos:

* Si hay n divisas en el modelo, el dataSource devuelve n + 1 secciones --> **testThatTableHasOneSectionMoreThanCurrencies**

* Si hay n moneys en una divisa, el data source debe de devolver n + 1 celdas para esa sección --> **testThatNumberOfCellsInSectionIsNumberOfMoneysInCurrencyPlusOne**

Otros:

* **testThatNumberOfRowsInLastSectionIsOne**: Nos aseguramos que la última sección sólo tiene una celda (en este caso es la del gran total).

##Test del objeto Wallet

* **testMoneyAtFirstPositionForEUR**: Me aseguro de que el primer Money que hay en la Currency EUR es el que usé para inicializar el objeto.
* **testOrderOfCurrencies**: Me aseguro de que el array de divisas en la wallet está ordenada alfabéticamente (EUR, USD).
* **testNumberOfMoneysPerCurrency**: Me aseguro de que el número de Moneys para EUR es 2. 
* **TestTotalForCurrency**: Me aseguro de que el total por divisa sea correcto.
* **testNumberOfCurrencies**: Me aseguro de que el número de divisas introducidas es 2 (EUR, USD).
* **testAdditionWithReduction**: test de que €60 + $20 = $140 2:1.
