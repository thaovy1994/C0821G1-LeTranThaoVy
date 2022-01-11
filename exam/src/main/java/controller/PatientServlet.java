package controller;

import bean.Patient;
import service.IPatientService;
import service.impl.PatientService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PatientServlet", urlPatterns = {"", "/index"})
public class PatientServlet extends HttpServlet {
    private IPatientService service = new PatientService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                break;
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        for (Patient patient : service.show()) {
            if (id.equals(patient.getPatient_id())) {
                service.delete(patient);
                request.setAttribute("msg", "Successful");
            } else {
                request.setAttribute("msg", "id can't found in list");
            }
        }
        request.setAttribute("patient", service.show());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patient_id = request.getParameter("patient_id");
        String records_id = request.getParameter("records_id");
        String name = request.getParameter("name");
        String day_in = request.getParameter("day_in");
        String day_out = request.getParameter("day_out");
        String reason = request.getParameter("reason");
        Patient patient = new Patient(patient_id,records_id,name,day_in,day_out,reason);
        Map<String, String> msgList = this.service.edit(patient);
        if (msgList.isEmpty()) {
            request.setAttribute("msg", "Successful");
        } else {
            request.setAttribute("msg", "Unsuccessful");
            request.setAttribute("msgName", msgList.get("name"));
        }
        request.setAttribute("patient", service.show());
        request.getRequestDispatcher("index.jsp").forward(request, response);
            try {
                request.getRequestDispatcher("create.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            default:
                getList(request, response);
                break;
        }
    }

    private void getList(HttpServletRequest request, HttpServletResponse response) {
        List<Patient> patientList = service.show();
        if (patientList == null) {
            request.setAttribute("msg", "No data to display ");
        } else {
            request.setAttribute("patient", patientList);
        }
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
