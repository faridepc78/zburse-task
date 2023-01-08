<?php

function randomNumbers($count): string
{
    $numbers = '123456789';

    $randomNumbers = '';

    for ($i = 0; $i < $count; $i++) {
        $index = rand(0, strlen($numbers) - 1);
        $randomNumbers .= $numbers[$index];
    }

    return $randomNumbers;
}
