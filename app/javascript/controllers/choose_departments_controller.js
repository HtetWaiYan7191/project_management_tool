import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="choose-departments"
export default class extends Controller {
  static targets = ["departments"];

  toggleDepartments(event) {
    const selectedValue = event.target.value;

   if (selectedValue === "choose_departments") {
     this.showDepartments();
     this.updateIsAllDepartment(false);
   } else {
     this.hideDepartments();
     this.updateIsAllDepartment(true);
   }
  }

  showDepartments() {
    this.departmentsTarget.classList.remove("d-none");
    this.departmentsTarget.classList.add("d-block");
  }

  hideDepartments() {
    this.departmentsTarget.classList.remove("d-block");
    this.departmentsTarget.classList.add("d-none");
  }

  updateIsAllDepartment(value) {
    const isAllDepartmentField =
      this.element.querySelector("#is_all_department");
    isAllDepartmentField.value = value;
  }
}
