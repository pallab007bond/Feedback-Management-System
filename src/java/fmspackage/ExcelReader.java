/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fmspackage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 *
 * @author Pallab Banerjee
 */
public class ExcelReader {
    public static void main(String args[]) throws IOException{
            /* Row row;
             Cell cell;
           try(Workbook wb= WorkbookFactory.create(new File("C:\\Users\\Pallab Banerjee\\Documents\\NetBeansProjects\\FMS\\src\\java\\Book1.xlsx")))
           {
              Sheet sheet=wb.getSheetAt(0); 
               int rowstart = sheet.getFirstRowNum();
               int rowend = sheet.getLastRowNum();
            for(int i=rowstart;i<rowend;i++){
                row= sheet.getRow(i);
               for(int j= row.getFirstCellNum();j<row.getLastCellNum();j++){
                    cell=row.getCell(j);
               System.out.println(cell.getStringCellValue());    
               }
               System.out.println("------------");
            }
               
        } catch (Exception ex) {
            ex.printStackTrace();
        } */
   FileInputStream fis=new FileInputStream(new File("C:\\Users\\Pallab Banerjee\\Documents\\NetBeansProjects\\FMS\\ExcelSheets\\Book1.xlsx"));
    
     XSSFWorkbook wb=new XSSFWorkbook(fis);
     //create a sheet object tp retrieve the sheet
     XSSFSheet sheet = wb.getSheetAt(0);
     //that is for evaluate the cell type
     FormulaEvaluator forlulaEvaluator=wb.getCreationHelper().createFormulaEvaluator();
     for(Row row:sheet)
     {
     for(Cell cell:row)
     {
     switch(forlulaEvaluator.evaluateInCell(cell).getCellType())
     {
     case Cell.CELL_TYPE_NUMERIC:
     System.out.print(cell.getNumericCellValue()+"\t\t");
     break;
     case Cell.CELL_TYPE_STRING:
     System.out.print(cell.getStringCellValue()+"\t\t");
     //case Cell.CELL_TYPE_NUMERIC:
   //  System.out.print(cell.getNumericCellValue()+"\t\t")
     }
     }
     System.out.println();
     }
	}
    
}
