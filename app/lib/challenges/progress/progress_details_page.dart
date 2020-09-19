import 'package:app/challenges/activity_helpers.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/util/datetime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProgressDetailsPage extends StatelessWidget {
  final Challenge challenge;

  ProgressDetailsPage(this.challenge);

  @override
  Widget build(BuildContext context) => Expanded(
        child: _ActivityTimeline(challenge),
      );
}

class _ActivityTimeline extends StatelessWidget {
  final Challenge _challenge;

  _ActivityTimeline(this._challenge);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 30),
        color: const Color(0xFF1D1E20),
        child: Theme(
          data: Theme.of(context).copyWith(
            accentColor: Colors.white.withOpacity(0.2),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _TimelineActivity(
                        steps: _generateSteps(_challenge),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _TimelineActivity extends StatelessWidget {
  const _TimelineActivity({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];

          final indicator = step.isCheckpoint
              ? _indicatorStyleCheckpoint(step)
              : const IndicatorStyle(width: 0);

          final righChild = _RightChildTimeline(step: step);

          Widget leftChild;
          if (step.hasHour) {
            leftChild = _LeftChildTimeline(step: step);
          }

          return TimelineTile(
            alignment: TimelineAlign.manual,
            isFirst: index == 0,
            isLast: index == steps.length - 1,
            lineXY: 0.25,
            indicatorStyle: indicator,
            startChild: leftChild,
            endChild: righChild,
            hasIndicator: step.isCheckpoint,
            beforeLineStyle: LineStyle(
              color: step.color,
              thickness: 8,
            ),
          );
        },
      );

  IndicatorStyle _indicatorStyleCheckpoint(Step step) => IndicatorStyle(
        width: 46,
        height: 100,
        indicator: Container(
          decoration: BoxDecoration(
            color: step.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Icon(
              step.icon,
              color: const Color(0xFF1D1E20),
              size: 30,
            ),
          ),
        ),
      );
}

class _RightChildTimeline extends StatelessWidget {
  const _RightChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    final minHeight = step.isCheckpoint ? 50.0 : 70.0;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: step.isCheckpoint ? 20 : 39, top: 8, bottom: 8, right: 8),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: step.message,
                  style: step.isCheckpoint
                      ? timelineText.apply(color: step.color)
                      : timelineText.apply(color: Colors.white),
                ),
                if (step.duration != null)
                  TextSpan(
                    text: '  ${step.duration} min',
                    style: timelineText.apply(color: const Color(0xFFF2F2F2)),
                  )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class _LeftChildTimeline extends StatelessWidget {
  const _LeftChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: step.isCheckpoint ? 10 : 29),
            child: Text(
              step.hour,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          )
        ],
      );
}

enum Type {
  checkpoint,
  line,
}

class Step {
  Step({
    this.type,
    this.hour,
    this.message,
    this.duration,
    this.color,
    this.icon,
  });

  final Type type;
  final String hour;
  final String message;
  final int duration;
  final Color color;
  final IconData icon;

  bool get isCheckpoint => type == Type.checkpoint;

  bool get hasHour => hour != null && hour.isNotEmpty;
}

List<Step> _generateSteps(Challenge challenge) =>
    [...challenge.activities.expand(_toStep), _lastStep(challenge)].toList();

Iterable<Step> _toStep(Activity activity) => [
      Step(
        type: Type.checkpoint,
        color: colorFor(activity),
        duration: activity.duration.inMinutes,
        hour: formatHourAndMinute(activity.startsAt),
        icon: iconFor(activity).icon,
        message: activity.sport.toUpperCase(),
      ),
      Step(
        type: Type.line,
        color: colorFor(activity),
        hour: ' ',
        icon: iconFor(activity).icon,
        message: '''${activity.user.name} moved '''
            '''${activity.kmMoved} km!''',
      ),
    ];

Step _lastStep(Challenge challenge) => Step(
      type: Type.checkpoint,
      color: Colors.white,
      hour: formatHourAndMinute(challenge.endsAt),
      icon: Icons.flag_outlined,
      message: 'DONE!!!',
    );
