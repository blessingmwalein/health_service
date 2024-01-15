import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/models/topic_model.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/app_container.dart';
import 'package:health_service/ui/util/icon.dart';
import 'package:health_service/ui/util/shared/symptom_card.dart';

@RoutePage()
class TopicSinglePage extends StatefulWidget {
  final Topic topic;
  const TopicSinglePage({super.key, required this.topic});

  @override
  State<TopicSinglePage> createState() => _TopicSinglePageState();
}

class _TopicSinglePageState extends State<TopicSinglePage> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Topics',
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: FadeInImage(
                  image: NetworkImage(
                    '${UrlStrings.imagesBase}${widget.topic.icon}',
                  ),
                  placeholder: const AssetImage('assets/images/default.jpg'),
                  // width: double.infinity,
                  // width: 100,
                  height: 200,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/default.jpg',
                      height: 40.0,
                      // width: 40.0,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.topic.title ?? '',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryBlack.withOpacity(0.7),
                ),
              ),
              Text(widget.topic.description ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primaryBlack.withOpacity(0.5),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Different Types',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: primaryBlack.withOpacity(0.7)),
              ),
              widget.topic.stis!.isNotEmpty
                  ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.topic.stis?.length,
                        itemBuilder: (context, index) {
                          // Assuming each symptom has a `name` and an `imagePath`
                          final sti = widget.topic.stis?[index];
                          return Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    context.router.push(
                                        StiSingleRoute(sti: sti ?? Sti()));
                                  },
                                  child: stiCard(sti ?? Sti())),
                              const SizedBox(width: 10),
                            ],
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        )));
  }
}
