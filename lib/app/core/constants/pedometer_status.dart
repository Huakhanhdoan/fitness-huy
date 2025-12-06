enum PedometerStatus {
  walking,
  stopped,
  unknown;

  String get displayName {
    switch (this) {
      case PedometerStatus.walking:
        return 'Walking';
      case PedometerStatus.stopped:
        return 'Stopped';
      case PedometerStatus.unknown:
        return 'Unknown';
    }
  }

  static PedometerStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'walking':
        return PedometerStatus.walking;
      case 'stopped':
        return PedometerStatus.stopped;
      default:
        return PedometerStatus.unknown;
    }
  }
}
