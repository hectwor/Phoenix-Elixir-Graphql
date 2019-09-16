defmodule CcibcWeb.Schema do
  use Absinthe.Schema
  alias CcibcWeb.PersonaResolver

  import_types(CcibcWeb.Schema.Types)


  query do
    field :usuarios, non_null(list_of(non_null(:usuario))) do
      resolve &PersonaResolver.usuarios/3
    end
    field :usuario, (non_null(:usuario)) do
      arg :id, non_null(:id)
      resolve &PersonaResolver.usuario/3
    end
  end

  mutation do
    field :crear_usuario, :usuario do
      arg :apellido_materno, non_null(:string)
      arg :apellido_paterno, non_null(:string)
      arg :contrasena, non_null(:string)
      arg :correo, non_null(:string)
      arg :nombres, non_null(:string)
      arg :rol_id, non_null(:integer)
      arg :username, non_null(:string)

      resolve &PersonaResolver.crear_usuario/3
    end

    field :editar_usuario, :usuario do
      arg(:id, non_null(:id))
      arg(:usuario, :update_usuario)

      resolve &PersonaResolver.editar_usuario/3
    end
  end

end
