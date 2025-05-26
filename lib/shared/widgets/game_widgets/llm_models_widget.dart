import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LlmModelsWidget extends StatelessWidget {
  const LlmModelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LlmModelWidget(modelName: 'mistral'),
          SizedBox(height: 20),
          LlmModelWidget(modelName: 'deepseek'),
          SizedBox(height: 20),
          LlmModelWidget(modelName: 'gemini'),
          SizedBox(height: 20),
          LlmModelWidget(modelName: 'claude'),
          SizedBox(height: 20),
          LlmModelWidget(modelName: 'chat gpt'),
          SizedBox(height: 20),
          LlmModelWidget(modelName: 'llama'),
        ],
      ),
    );
  }
}

class LlmModelWidget extends StatelessWidget {
  final String modelName;

  const LlmModelWidget({super.key, required this.modelName});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          modelName,
          style: theme.display2,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LLMsBtnWidget(
              text: 'copy prompt',
              onPressed: () {
                // TODO add copy prompt + go to website
              },
            ),
            LLMsBtnWidget(
              text: 'key settings',
              onPressed: () {
                // TODO add key settings
              },
            ),
            LLMsBtnWidget(
              text: 'send photo',
              onPressed: () {
                // TODO add send photo
              },
            ),
          ],
        ),
      ],
    );
  }
}

class LLMsBtnWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LLMsBtnWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: theme.borderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: theme.display6,
          ),
        ),
      ),
    );
  }
}
