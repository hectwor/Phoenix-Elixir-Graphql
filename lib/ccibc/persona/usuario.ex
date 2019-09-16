defmodule Ccibc.Persona.Usuario do
  use Ecto.Schema
  import Ecto.Changeset


  schema "usuarios" do
    field :apellido_materno, :string
    field :apellido_paterno, :string
    field :contrasena, :string
    field :correo, :string
    field :nombres, :string
    field :rol_id, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nombres, :apellido_paterno, :apellido_materno, :correo, :username, :contrasena, :rol_id])
    |> validate_required([:nombres, :apellido_paterno, :apellido_materno, :correo, :username, :contrasena, :rol_id])
  end
end
