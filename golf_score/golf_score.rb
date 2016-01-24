hole_scores = [
{
  hole: 1,
  par: 5,
  score: 7
},
{
  hole: 2,
  par: 4,
  score: 5
},
{
  hole: 3,
  par: 3,
  score: 3
},
{
  hole: 4,
  par: 4,
  score: 4
},
{
  hole: 5,
  par: 4,
  score: 4
},
{
  hole: 6,
  par: 3,
  score: 2
},
{
  hole: 7,
  par: 4,
  score: 5
},
{
  hole: 8,
  par: 5,
  score: 5
},
{
  hole: 9,
  par: 4,
  score: 5
},
{
  hole: 10,
  par: 5,
  score: 7
},
{
  hole: 11,
  par: 4,
  score: 4
},
{
  hole: 12,
  par: 4,
  score: 4
},
{
  hole: 13,
  par: 3,
  score: 3
},
{
  hole: 14,
  par: 4,
  score: 5
},
{
  hole: 15,
  par: 4,
  score: 5
},
{
  hole: 16,
  par: 4,
  score: 4
},
{
  hole: 17,
  par: 3,
  score: 3
},
{
  hole: 18,
  par: 5,
  score: 6
}
]
par_score = 0
your_score = 0

hole_scores.each do |hole_hash|
  par_score += hole_hash[:par]
  your_score += hole_hash[:score]
end

puts par_score - your_score 
