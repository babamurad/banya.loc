<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class EmployeFactory extends Factory
{

    protected static ?string $password;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'phone' => $this->faker->phoneNumber(),
            'address' => $this->faker->randomDigitNotNull(),
            'department_id' => 1,
            'role_id' => 1,
            'jobtitle_id' => 1,
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            //'email' => fake()->unique()->safeEmail(),
            //'email_verified_at' => now(),
            //'password' => static::$password ??= Hash::make('password'),
            //'remember_token' => Str::random(10),
        ];
    }
}
