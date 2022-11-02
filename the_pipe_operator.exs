defmodule Student do
  def scoala, do: "fresh"
  def mananca(state), do: state <> " + " <> "satul"
  def la_curs(state), do: state <> " + " <> "mai istet si mai obosit"
  def la_seminar(state), do: state <> " + " <> "mai istet, dar flamand"
  def doarme(state), do: state <> " + " <> "adormit"
  def trezit_de_profesor(state), do: state <> " + " <> "la tabla"
  def la_examen(state), do: state <> " + " <> "extenuat"
  def la_coada_la_Petru(state), do: state <> " + " <> "minus 5 lei"
  def la_coada_la_Luca(state), do: state <> " + " <> "minus 6 lei"
  def la_somn(state), do: state <> " + " <> "foarte obosit"
end

Student.scoala |>
Student.mananca |>
Student.la_curs |>
Student.la_seminar |>
Student.mananca |>
Student.la_curs |>
Student.doarme |>
Student.trezit_de_profesor |>
Student.la_examen |>
Student.la_coada_la_Petru |>
Student.la_coada_la_Luca |>
Student.la_curs |>
Student.la_somn |>
IO.inspect
