 defmodule Calculator do
    def start() do
        otavio = %Student{name: "Otavio Miranda", results: build_subjects([9.8, 3.9, 5.8, 8.5])}
        bruna = %Student{name: "Bruna Rodrigues", results: build_subjects([8.5, 6.6, 8.6, 5.3])}
        carlota = %Student{name: "Carlota Miranda", results: build_subjects([5.9, 4.9, 2.8, 5.5])}
        bernadette = %Student{name: "Bernadette Rodrigues", results: build_subjects([7.7, 5.5, 9.8, 10.0])}
        result = calculate([otavio, bruna, carlota, bernadette])
        best = best_results(result)
        best_order = order_results(result)
        {result, best, best_order}
    end

    defp order_results(result) do
        result |> Enum.sort()#completar
    end

    defp calculate(studants) do
        studants |> Enum.map(fn x -> 
        %{
            average: average(x),
            first_name: Student.first_name(x),
            last_name: Student.last_name(x)
            } 
        end)
    end

    defp best_results(studants) do
        max_result = studants |> Enum.map(& &1.average) |> Enum.max()
        studants |> Enum.filter(fn(x) -> x.average == max_result end)
    
    end

    defp average(studant) do
        number_of_subjetcs = Enum.count(studant.results)

        sum_of_grades = studant.results |> Enum.map(& &1.result) |> Enum.reduce(fn(x, acc) -> x + acc end)
        #sum_of_grades = studant.results |> Enum.map(& &1.result) |> Enum.reduce(&(&1+&2))
        Float.ceil(sum_of_grades / number_of_subjetcs, 2)
    end


    def build_subjects(grades_list) do
        subjects = ["Matematica", "Portugues", "Geografia", "História"]
        subjects |> Enum.map( &(%Subject{name: &1, result: Enum.random(grades_list)}))
    end
end
