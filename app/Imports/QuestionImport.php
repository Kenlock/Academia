<?php

namespace App\Imports;

use App\Models\MultiChoice;
use App\Models\Choices;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class QuestionImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $rows){

      $quiz_id = session('quiz_id');

      // echo "<pre>" . $rows['item_number'] . "</pre>".$rows['question']."</br>";
      return new MultiChoice([
        'quiz_id' => $quiz_id,
        'item_number' => $rows['item_number'],
        'question' => $rows['question'],
        'correct_answer' => $rows['correct_answer'],
        'choice_A' => $rows['choice_a'],
        'choice_B' => $rows['choice_b'],
        'choice_C' => $rows['choice_c'],
        'choice_D' => $rows['choice_d'],
        'points' => $rows['points'],
      ]);

    }
}
