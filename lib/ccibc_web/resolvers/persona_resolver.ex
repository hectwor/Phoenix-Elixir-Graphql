defmodule CcibcWeb.PersonaResolver do
  alias Ccibc.Persona

  def usuarios(_root, _args, _info) do
    usuarios = Persona.list_usuarios()
    {:ok, usuarios}
  end

  def usuario(_, %{id: id}, _) do
    usuario = Persona.get_usuario!(id)
    {:ok, usuario}
  end

  def crear_usuario(_root, args, _info) do
    case Persona.create_usuario(args) do
      {:ok, usuario} ->
        {:ok, usuario}
      _error ->
        {:error, "no se pudo crear un usuario"}
    end
  end

  def editar_usuario(_,%{id: id, usuario: usuario_params}, _) do
    case Persona.update_usuario(Persona.get_usuario!(id),usuario_params) do
      {:ok, usuario} ->
        {:ok, usuario}
      _error ->
        {:error, "no se editar un usuario"}
    end
  end

end
