import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenantmodule/constants/app_theme.dart';
import '../services/invoices_service.dart';
import '../widgets/invoice_filter_dialog.dart';
import '../widgets/invoice_card.dart';
import '../widgets/side_drawer.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({Key? key}) : super(key: key);

  static const routeName = '/invoices';

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  late InvoicesProvider _invoicesProv;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      _invoicesProv = Provider.of<InvoicesProvider>(context, listen: false);
      _invoicesProv.fetchTenantInvoices('0722748949');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text(
          'Invoices',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
                tooltip: 'Reset filter',
                onPressed: () => _invoicesProv.resetFilter(),
                icon: const Icon(Icons.restore)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _invoicesProv.resetFilter(),
        color: kAccentColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Consumer<InvoicesProvider>(
                  builder: (_, invoicesProvider, __) {
                    if (invoicesProvider.fetchDataStatus ==
                        DataStatus.fetching) {
                      return const Align(child: CircularProgressIndicator());
                    } else {
                      return invoicesProvider.filteredInvoices.isEmpty
                          ? const Center(
                              child: Text('There are no invoices to display'))
                          : Column(
                              children: [
                                Text(
                                  'Total Amount: Ksh ${invoicesProvider.totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.blueGrey[700],
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                ListView.builder(
                                    controller: ScrollController(),
                                    shrinkWrap: true,
                                    itemCount: invoicesProvider
                                        .filteredInvoices.length,
                                    itemBuilder: (ctx, index) => InvoiceCard(
                                        invoice: invoicesProvider
                                            .filteredInvoices[index])),
                              ],
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) {
            return const InvoiceFilterDialog();
          },
        ).then((filterObject) {
          if (filterObject != null) {
            switch (filterObject['filterValue']) {
              case 'House':
                // _invoicesProv.filterInvoicesByUnit(filterObject['house']);
                //* Reset invoices for now
                _invoicesProv.resetFilter();
                break;
              case 'Date':
                _invoicesProv.filterInvoicesByDate(
                    filterObject['dateBefore'], filterObject['dateAfter']);
                break;
              case 'Amount':
                _invoicesProv.filterInvoicesByAmount(
                    filterObject['lowAmount'], filterObject['highAmount']);
            }
          }
        }),
        tooltip: 'Filter',
        child: const Icon(Icons.filter_list_rounded, color: Colors.white),
      ),
    );
  }
}
