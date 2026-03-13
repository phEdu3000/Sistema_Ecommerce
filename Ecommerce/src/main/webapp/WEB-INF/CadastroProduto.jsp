<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Cadastro de Produto</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Novo Produto</h1>
        <p class="subtitulo">Preencha os dados abaixo</p>

        <form action="BackProduto" method="post" accept-charset="UTF-8">
            <!-- Nome do Produto -->
            <div class="campo">
                <label for="produto">Nome do produto</label>
                <input type="text" id="produto" name="produto" placeholder="Ex: Camisa Polo" required>
            </div>

            <!-- Preço do Produto -->
            <div class="campo">
                <label for="preco">Preço (R$)</label>
                <input type="number" step="0.01" id="preco" name="preco" placeholder="Ex: 99.90" min="0" required>
            </div>

            <!-- Quantidade em Estoque -->
            <div class="campo">
                <label for="quantidade">Quantidade em estoque</label>
                <input type="number" id="quantidade" name="quantidade" placeholder="Ex: 10" min="0" required>
            </div>

            <!-- Botão de Enviar -->
            <div class="campo">
                <button type="submit">Cadastrar Produto</button>
            </div>

            <!-- Link de Voltar -->
            <a href="Index.jsp" class="voltar">← Voltar</a>
        </form>
    </div>
</body>
</html>
