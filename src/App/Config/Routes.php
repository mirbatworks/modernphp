<?php

declare(strict_types=1);

namespace App\Config;

use Framework\App;
use App\Controllers\{
    HomeController,
    AboutController,
    AuthController,
    ErrorController,
    TransactionController,
    ReceiptController
};

use App\Middleware\{AuthRequiredMiddleware, GuestOnlyMiddleware};

/* Register route method */

function route(App $app)
{
    $app->get('/', [HomeController::class, 'home'])->middleware(AuthRequiredMiddleware::class);
    $app->get('/about', [AboutController::class, 'about']);
    $app->get('/register', [AuthController::class, 'index'])->middleware(GuestOnlyMiddleware::class);
    $app->post('/register', [AuthController::class, 'register'])->middleware(GuestOnlyMiddleware::class);
    $app->get('/login', [AuthController::class, 'loginView'])->middleware(GuestOnlyMiddleware::class);
    $app->post('/login', [AuthController::class, 'login'])->middleware(GuestOnlyMiddleware::class);
    $app->get('/logout', [AuthController::class, 'logout'])->middleware(AuthRequiredMiddleware::class);
    $app->get('/transaction', [TransactionController::class, 'createView'])->middleware(AuthRequiredMiddleware::class);
    $app->post('/transaction', [TransactionController::class, 'create'])->middleware(AuthRequiredMiddleware::class);
    $app->get('/transaction/{transaction}', [TransactionController::class, 'editView'])->middleware(AuthRequiredMiddleware::class);
    $app->post('/transaction/{transaction}', [TransactionController::class, 'edit'])->middleware(AuthRequiredMiddleware::class);
    $app->delete('/transaction/{transaction}', [TransactionController::class, 'delete'])->middleware(AuthRequiredMiddleware::class);
    $app->get('/transaction/{transaction}/receipt', [ReceiptController::class, 'uploadView'])->middleware(AuthRequiredMiddleware::class);
    $app->post('/transaction/{transaction}/receipt', [ReceiptController::class, 'upload'])->middleware(AuthRequiredMiddleware::class);
    $app->get('/transaction/{transaction}/receipt/{receipt}', [ReceiptController::class, 'download'])->middleware(AuthRequiredMiddleware::class);
    $app->delete('/transaction/{transaction}/receipt/{receipt}', [ReceiptController::class, 'delete'])->middleware(AuthRequiredMiddleware::class);

    $app->setErrorHandler([ErrorController::class, 'notFound']);
}
