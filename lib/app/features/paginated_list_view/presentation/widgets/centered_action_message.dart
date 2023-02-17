import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';

class CenteredActionMessage extends StatelessWidget {
  final String message;
  final String actionButtonText;
  final VoidCallback? onActionPressed;
  final Color? textColor;
  final Color? actionButtonColor;
  final Color? actionButtonTextColor;

  const CenteredActionMessage(
    this.message, {
    Key? key,
    this.actionButtonText = 'Tentar novamente',
    this.onActionPressed,
    this.textColor,
    this.actionButtonColor,
    this.actionButtonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PokedexDimen.normal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor ?? Colors.grey[600],
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: onActionPressed != null ? PokedexDimen.normal : 0),
            Visibility(
              visible: onActionPressed != null,
              child: TextButton(
                onPressed: onActionPressed,
                style: TextButton.styleFrom(
                  foregroundColor: actionButtonColor,
                ),
                child: Text(actionButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
