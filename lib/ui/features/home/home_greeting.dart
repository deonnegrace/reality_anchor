/// Time-of-day greeting for Home. No name until an account exists.
String homeGreeting(DateTime now) {
  final hour = now.hour;
  if (hour < 12) {
    return 'Good morning';
  }
  if (hour < 17) {
    return 'Good afternoon';
  }
  return 'Good evening';
}
