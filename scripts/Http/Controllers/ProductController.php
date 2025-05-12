<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    // Mostrar todos los productos
    public function index()
    {
        $products = Product::all();
        return view('products.index', compact('products'));
    }

public function movimientos()
{
    $products = Product::where('is_active', 1)->get();
    return view('products.movimientos', compact('products'));
}


    // Mostrar formulario para crear producto
    public function create()
    {
        return view('products.create');
    }

    // Guardar producto
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'quantity' => 'required|integer|min:0',
        ]);

        Product::create([
            'name' => $request->name,
            'description' => $request->description,
            'quantity' => $request->quantity,
            'is_active' => true,
        ]);

        return redirect()->route('products.index')->with('success', 'Producto creado correctamente');
    }


    // Cambiar estatus activo/inactivo
    public function toggleStatus($id)
    {
        $product = Product::findOrFail($id);
        $product->is_active = !$product->is_active;
        $product->save();

        return redirect()->route('products.index')->with('success', 'Estatus actualizado');
    }
}
