import 'package:flutter/material.dart';
import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/list_product_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/molecular/card_product_component_view.dart';
import 'package:marketplace/src/views/components/molecular/imovel_product_component.dart';
import 'package:marketplace/src/views/components/templates/products/list_products_mobile_template.dart';
import 'package:provider/provider.dart';

class ListProductMobileView extends StatefulWidget {
  ListProductController listProductController;
  ListProductMobileView({super.key, required this.listProductController});

  @override
  State<ListProductMobileView> createState() => _ListProductMobileViewState();
}

class _ListProductMobileViewState extends State<ListProductMobileView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    return Scaffold(
      body: ListProductsMobileTemplate(
        listWidgetsDisplay: [
            ImovelProductComponent(),
          ImovelProductComponent(),
          ImovelProductComponent(),
          ImovelProductComponent(),
          ImovelProductComponent(),
          ImovelProductComponent(),
          ImovelProductComponent(),


        ],
        listWidgetsDrawer: [

          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ButtonGeneric(
              nameButton: "Entrar",
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              borderRadius: BorderRadius.circular(20),
              font: 15,
              backgroundColor:
              color.getColorTheme().getColorBackgroudPrimary(),
              titleColor:
              color.getColorTheme().getColorSubTittleSecundary(),
              controller: widget.listProductController,
              loading: widget.listProductController.loading,
              function: () {
                widget.listProductController.displayLogin(context);
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ButtonGeneric(
              nameButton: "Entrar",
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              borderRadius: BorderRadius.circular(20),
              font: 15,
              backgroundColor:
              color.getColorTheme().getColorBackgroudPrimary(),
              titleColor:
              color.getColorTheme().getColorSubTittleSecundary(),
              controller: widget.listProductController,
              loading: widget.listProductController.loading,
              function: () {
                widget.listProductController.displayLogin(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ButtonGeneric(
              nameButton: "Entrar",
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              borderRadius: BorderRadius.circular(20),
              font: 15,
              backgroundColor:
              color.getColorTheme().getColorBackgroudPrimary(),
              titleColor:
              color.getColorTheme().getColorSubTittleSecundary(),
              controller: widget.listProductController,
              loading: widget.listProductController.loading,
              function: () {
                widget.listProductController.displayLogin(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ButtonGeneric(
              nameButton: "Entrar",
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              borderRadius: BorderRadius.circular(20),
              font: 15,
              backgroundColor:
              color.getColorTheme().getColorBackgroudPrimary(),
              titleColor:
              color.getColorTheme().getColorSubTittleSecundary(),
              controller: widget.listProductController,
              loading: widget.listProductController.loading,
              function: () {
                widget.listProductController.displayLogin(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ButtonGeneric(
              nameButton: "Entrar",
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              borderRadius: BorderRadius.circular(20),
              font: 15,
              backgroundColor:
              color.getColorTheme().getColorBackgroudPrimary(),
              titleColor:
              color.getColorTheme().getColorSubTittleSecundary(),
              controller: widget.listProductController,
              loading: widget.listProductController.loading,
              function: () {
                widget.listProductController.displayLogin(context);
              },
            ),
          ),

        ],

      ),
    );
  }
}
