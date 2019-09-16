defmodule CcibcWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :usuario do
    field :id, non_null(:id)
    field :apellido_materno, non_null(:string)
    field :apellido_paterno, non_null(:string)
    field :contrasena, non_null(:string)
    field :correo, non_null(:string)
    field :nombres, non_null(:string)
    field :rol_id, non_null(:integer)
    field :username, non_null(:string)
  end

  input_object :update_usuario do
    field :apellido_materno, :string
    field :apellido_paterno, :string
    field :contrasena, :string
    field :correo, :string
    field :nombres, :string
    field :rol_id, :integer
    field :username, :string
  end
end