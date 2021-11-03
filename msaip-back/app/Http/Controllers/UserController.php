<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller {

  public function loggedIn() {
    if (auth()->user()) {
      return response([
        "user" => auth()->user(),
        "message" => "User logged in.",
      ], 200);
    }

    return response([
      "user" => null,
      "message" => "Not logged in.",
    ], 401);
  }

  public function login(Request $request) {
    // VALIDATE DATA
    $validator = Validator::make($request->all(), [
      'email' => 'required|email',
      'password' => 'required|string',
    ]);

    if ($validator->fails()) {
      return response([
        'user' => null,
        'message' => 'Validation failed.',
        'errors' => $validator->messages(),
      ], 400);
    }

    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
      return response([
        "user" => null,
        "message" => "Login failed.",
      ], 401);
    }

    $token = $user->createToken('usertoken');
    $user = $user->fresh(['savedCars']);

    return response([
      "user" => $user,
      "message" => "Login successful",
      'token' => $token->plainTextToken,
    ], 200);
  }

  public function logout(Request $request) {
    $user = auth()->user();
    $user->tokens()->delete();

    return response([
      "user" => $user,
      "message" => "Logout successful.",
    ], 200);
  }

  public function register(Request $request) {
    try {
      // VALIDATE DATA
      $validator = Validator::make($request->all(), [
        'username' => 'required|alpha_dash|min:2|unique:users,username',
        'email' => 'required|string|email|unique:users,email',
        'password' => 'required|string|min:4|confirmed',
      ]);

      if ($validator->fails()) {
        return response([
          'user' => null,
          'message' => 'Validation failed.',
          'errors' => $validator->messages(),
        ], 400);
      }


      $user = new User;
      $user->username = $request->username;
      $user->email = $request->email;
      $user->password = Hash::make($request->password);
      $user->save();
      $token = $user->createToken('usertoken');
      $user = $user->fresh(['savedCars']);

      return response([
        "user" => $user,
        "message" => "User created.",
        'token' => $token->plainTextToken,
      ], 201);
    } catch (Exception $e) {
      return response([
        "user" => null,
        "message" => $e->getMessage(),
      ], 500);
    }
  }
}
