defmodule Ccibc.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombres, :string
      add :apellido_paterno, :string
      add :apellido_materno, :string
      add :correo, :string
      add :username, :string
      add :contraseña, :string
      add :rol_id, :integer

      timestamps()
    end

  end
end
