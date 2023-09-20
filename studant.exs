defmodule Student do
    defstruct name: nil, results: []

    def first_name(studant) do
        studant.name |> String.split() |> List.first()
    end

    def last_name(studant) do
        studant.name |> String.split() |> List.last()
    end 
end