import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int collapsedMaxLines;

  const ExpandableText({
    super.key,
    required this.text,
    this.collapsedMaxLines = 2,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final span = TextSpan(
          text: widget.text,
          style: Theme.of(context).textTheme.bodySmall,
        );
        final textPainter = TextPainter(
          text: span,
          maxLines: widget.collapsedMaxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.text,
                maxLines: _expanded ? 5 : widget.collapsedMaxLines,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.blueGrey),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: Text(
                  _expanded
                      ? 'show less'
                      : 'show more', // Properly toggles text
                  style: const TextStyle(
                    color: Colors.blue,
                    height: 1,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.blueGrey),
          );
        }
      },
    );
  }
}
