defmodule Ccibc.PersonaTest do
  use Ccibc.DataCase

  alias Ccibc.Persona

  describe "usuarios" do
    alias Ccibc.Persona.Usuario

    @valid_attrs %{apellido_materno: "some apellido_materno", apellido_paterno: "some apellido_paterno", contraseña: "some contraseña", correo: "some correo", nombres: "some nombres", rol_id: 42, username: "some username"}
    @update_attrs %{apellido_materno: "some updated apellido_materno", apellido_paterno: "some updated apellido_paterno", contraseña: "some updated contraseña", correo: "some updated correo", nombres: "some updated nombres", rol_id: 43, username: "some updated username"}
    @invalid_attrs %{apellido_materno: nil, apellido_paterno: nil, contraseña: nil, correo: nil, nombres: nil, rol_id: nil, username: nil}

    def usuario_fixture(attrs \\ %{}) do
      {:ok, usuario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persona.create_usuario()

      usuario
    end

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Persona.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Persona.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      assert {:ok, %Usuario{} = usuario} = Persona.create_usuario(@valid_attrs)
      assert usuario.apellido_materno == "some apellido_materno"
      assert usuario.apellido_paterno == "some apellido_paterno"
      assert usuario.contraseña == "some contraseña"
      assert usuario.correo == "some correo"
      assert usuario.nombres == "some nombres"
      assert usuario.rol_id == 42
      assert usuario.username == "some username"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persona.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      assert {:ok, usuario} = Persona.update_usuario(usuario, @update_attrs)
      assert %Usuario{} = usuario
      assert usuario.apellido_materno == "some updated apellido_materno"
      assert usuario.apellido_paterno == "some updated apellido_paterno"
      assert usuario.contraseña == "some updated contraseña"
      assert usuario.correo == "some updated correo"
      assert usuario.nombres == "some updated nombres"
      assert usuario.rol_id == 43
      assert usuario.username == "some updated username"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Persona.update_usuario(usuario, @invalid_attrs)
      assert usuario == Persona.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Persona.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Persona.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Persona.change_usuario(usuario)
    end
  end
end
