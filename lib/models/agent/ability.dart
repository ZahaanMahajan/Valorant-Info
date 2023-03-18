// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ability {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  // factory Ability.fromJson(Map<String, dynamic> json) {
  //   throw UnimplementedError('Ability.fromJson($json) is not implemented');
  // }

  // Map<String, dynamic> toJson() {
  //   throw UnimplementedError();
  // }
}
