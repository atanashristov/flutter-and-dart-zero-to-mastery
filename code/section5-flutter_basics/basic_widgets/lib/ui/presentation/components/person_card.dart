import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String pictureUrl;
  final String name;
  final String age;
  final String country;
  final String job;

  const PersonCard({
    required this.pictureUrl,
    required this.name,
    required this.age,
    required this.country,
    required this.job,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyleTitleLarge = Theme.of(context).textTheme.titleLarge;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover, // Normally `BoxFit.cover`
                    image: NetworkImage(pictureUrl),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white54),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    name,
                    style: textStyleTitleLarge,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _PersonInfo(age: age, job: job, country: country),
          )
        ],
      ),
    );
  }
}

class _PersonInfo extends StatelessWidget {
  const _PersonInfo({
    Key? key,
    required this.age,
    required this.job,
    required this.country,
  }) : super(key: key);

  final String age;
  final String job;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PersonInfoRow(caption: 'age', value: age),
        const SizedBox(height: 4),
        _PersonInfoRow(caption: 'job', value: job),
        const SizedBox(height: 4),
        _PersonInfoRow(caption: 'country', value: country),
      ],
    );
  }
}

class _PersonInfoRow extends StatelessWidget {
  final String caption;
  final String value;

  const _PersonInfoRow({
    Key? key,
    required this.caption,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTitleSmall = Theme.of(context).textTheme.titleSmall;

    // To avoid overflow with long texts, use combination of Flexible and Expanded.
    return Row(
      // Align so that the right "column" aligns on the vertical
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Use Flexible for the shorter text
        Flexible(
          child: Text('$caption:', style: textStyleTitleSmall),
        ),
        const Spacer(),
        // Use Expanded for the longer text
        Expanded(
          flex: 2,
          child: Text(value, style: textStyleTitleSmall),
        ),
      ],
    );
  }
}
