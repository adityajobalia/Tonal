/**
 * Data class to manage values
 */

class Model{
  String label = '';
  int weight = 0;

  Model(this.label, this.weight);

/**
 * Getter and setter for label
 */
  String get getLabel => label;
  void set setLabel(String label) => this.label = label;

/**
 * Getter and setter for weight
 */
  int get getWeight => weight;
  void set setWeight(int weight) => this.weight = weight;

}