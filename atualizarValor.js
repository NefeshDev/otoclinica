function atualizarValor() {
    const selectServico = document.getElementById('servico');
    const opcaoSelecionada = selectServico.options[selectServico.selectedIndex];
    const preco = opcaoSelecionada.getAttribute('data-preco') || '0.00';
    const precoFormatado = parseFloat(preco).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    
    document.getElementById('precoConsulta').textContent = precoFormatado;
}

// Inicializar com data mínima como hoje
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('data').min = new Date().toISOString().split('T')[0];
    atualizarValor();
});