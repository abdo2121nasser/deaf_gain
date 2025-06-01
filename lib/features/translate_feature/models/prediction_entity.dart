class PredictionModel {
  final int predictionIdx;
  final double confidence;
  final String arabic;
  final String english;

  PredictionModel({
    required this.predictionIdx,
    required this.confidence,
    required this.arabic,
    required this.english,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      predictionIdx: json['pred_idx'],
      confidence: (json['confidence'] as num).toDouble(),
      arabic: json['arabic'],
      english: json['english'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pred_idx': predictionIdx,
      'confidence': confidence,
      'arabic': arabic,
      'english': english,
    };
  }
}
