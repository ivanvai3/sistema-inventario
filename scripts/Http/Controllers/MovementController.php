<?php

namespace App\Http\Controllers;

use App\Models\Movement;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MovementController extends Controller
{
    // Listar movimientos con filtros
    public function index(Request $request)
    {
        $products = Product::all();
        $query = Movement::with(['product', 'user']);

        if ($request->filled('type')) {
            $query->where('type', $request->type);
        }

        if ($request->filled('product_id')) {
            $query->where('product_id', $request->product_id);
        }

        $movements = $query->orderBy('created_at', 'desc')->get();

        return view('movements.index', compact('movements', 'products'));
    }

    // Mostrar formulario para un producto específico
    public function create($id, Request $request)
    {
        $product = Product::findOrFail($id);
        $type = $request->get('type'); // 'in' o 'out'

        return view('movements.create', compact('product', 'type'));
    }


    // Procesar el registro del movimiento
public function store(Request $request)
{
    $request->validate([
        'product_id' => 'required|exists:products,id',
        'type' => 'required|in:entrada,salida',
        'quantity' => 'required|integer|min:1',
    ]);

    $product = Product::findOrFail($request->product_id);

    if ($request->type === 'salida' && $product->quantity < $request->quantity) {
        return back()->withErrors(['quantity' => 'No hay suficiente stock disponible.'])->withInput();
    }

    $product->quantity += ($request->type === 'entrada') ? $request->quantity : -$request->quantity;
    $product->save();

    Movement::create([
        'product_id' => $product->id,
        'user_id'    => Auth::id(),
        'type'       => $request->type,
        'quantity'   => $request->quantity,
    ]);

    // Mostrar vista de confirmación en lugar de redirigir
    return view('movements.created');
}



    public function selectProduct()
    {
        $products = Product::all();
        return view('movements.select_product', compact('products'));
    }
}
