<?php
	session_start();
	include './dbconnect.php';
	
	
if( !isset($_POST['low']) || !isset($_POST['high']) ||
	$_POST['low'] == '' || $_POST['high'] == '' ) {
	header("location: ../administrator/export.php");
} else {
	
	$low 	= date('Y-m-d H:i:s', strtotime($_POST['low']) );
	$high 	= date('Y-m-d H:i:s', strtotime($_POST['high'] . "+1 days") );

/**
 * PHPExcel
 *
 * Copyright (C) 2006 - 2013 PHPExcel
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * @category   PHPExcel
 * @package    PHPExcel
 * @copyright  Copyright (c) 2006 - 2013 PHPExcel (http://www.codeplex.com/PHPExcel)
 * @license    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt	LGPL
 * @version    1.7.9, 2013-06-02
 */


/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Asia/Jakarta');



if (PHP_SAPI == 'cli')
	die('This example should only be run from a Web Browser');

/** Include PHPExcel */
require_once './phpexcel/PHPExcel.php';


// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator($_SESSION['ses_name'])
							 ->setLastModifiedBy($_SESSION['ses_name'])
							 ->setTitle("Isuzu Astra Motor Indonesia - Service")
							 ->setSubject("Technical Information Report")
							 ->setDescription("TIR Data Export.")
							 ->setKeywords("")
							 ->setCategory("Urgent");



// ================================================================= sheet 1 START

// insert image to sheet

/*$objPHPExcel->getActiveSheet()->mergeCells('B2:AY4');
$objPHPExcel->getActiveSheet()->getStyle('B2')->getAlignment()->setWrapText(true)->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
$objPHPExcel->getActiveSheet()->getStyle('B2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);*/

$objDrawing = new PHPExcel_Worksheet_Drawing();
$objDrawing->setName('Isuzu Astra Motor Indonesia - Service');
$objDrawing->setDescription('Isuzu Astra Motor Indonesia - Service');
$objDrawing->setPath('../img/logo-red.png');
$objDrawing->setCoordinates('A1');
$objDrawing->setHeight(57);
//$objDrawing->setOffsetX(216);
$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());





// create new sheet
//$objPHPExcel->createSheet();


// Make sheetstyle

$objPHPExcel->setActiveSheetIndex(0)
			->setCellValue('AE65536', ' ');
														
			

$objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(42.75);
$objPHPExcel->getActiveSheet()->getRowDimension('3')->setRowHeight(36);


$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_BOTTOM);
$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

			

$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A3:AE3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

$objPHPExcel->getActiveSheet()->getStyle('A3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('B3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('C3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('D3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('E3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('F3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('G3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('H3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('I3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('J3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('K3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('L3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('M3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('N3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('O3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('P3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Q3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('R3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('S3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('T3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('U3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('V3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('W3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('X3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Y3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Z3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AA3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AB3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AC3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AD3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AE3')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);





// Add static value
$objPHPExcel->setActiveSheetIndex(0)
			->setCellValue('A3', 'No.')
			->setCellValue('B3', 'VIN')
			->setCellValue('C3', 'Mileage')
			->setCellValue('D3', 'Unit type')
			->setCellValue('E3', 'Information source')
			->setCellValue('F3', 'Local TIR No.')
			->setCellValue('G3', 'Dealer Code')
			->setCellValue('H3', 'YYMM')
			->setCellValue('I3', 'Description')
			->setCellValue('J3', 'LTIR Date')
			->setCellValue('K3', 'Problem Date')
			->setCellValue('L3', 'LTIR Received')
			->setCellValue('M3', 'LTIR Replied')
			->setCellValue('N3', 'E/TIR')
			->setCellValue('O3', 'Judgment date')
			->setCellValue('P3', 'C/L')
			->setCellValue('Q3', 'Issued Date')
			->setCellValue('R3', 'E/TIR No.')
			->setCellValue('S3', 'Parts YES/NO')
			->setCellValue('T3', 'Part Name')
			->setCellValue('U3', 'Received Date')
			->setCellValue('V3', 'Part Status')
			->setCellValue('W3', 'Go out date')
			->setCellValue('X3', 'Count')
			->setCellValue('Y3', 'Week')
			->setCellValue('Z3', 'Part Remark')
			->setCellValue('AA3', 'FQM Status')
			->setCellValue('AB3', 'FQM Reg. No.')
			->setCellValue('AC3', 'FQM Reg. date')
			->setCellValue('AD3', 'FQM Reg. Closed date')
			->setCellValue('AE3', 'Problem remark');
			




// insert dynamic data
/*
$query = "select t1.id_ticket, t2.vin_mobil, t1.mileage, t3.tipe_mobil, t4.timestamp_ticket as start, t1.problem_date, t1.topic, t5.timestamp_ticket as submit, t6.timestamp_ticket as reply, t8.status_tir_jepang, t8.time_stamp_tir, t7.tir_jepang, t10.return_to_type, t11.return_part, t12.fqm_status, t12.fqm_no, t12.reg_date, t12.closed_date, t9.arrived_time, t9.part_number, t9.part_name
						from ticket as t1 
					join mobil as t2 on t2.id_mobil = t1.id_mobil
					join tipe_mobil as t3 on t3.id_tipe_mobil = t2.id_tipe_mobil
					join timestamp_ticket as t4 on t4.id_ticket = t1.id_ticket
					left join timestamp_ticket as t5 on ( t5.id_ticket = t1.id_ticket and t5.id_status_ticket = '2' )
					left join timestamp_ticket as t6 on ( t6.id_ticket = t1.id_ticket and t6.id_status_ticket in ('3', '4') )
					left join tir as t7 on t7.id_ticket = t1.id_ticket
					left join status_tir_jepang as t8 on t8.id_tir = t7.id_tir
					left join timestamp_return_part as t9 on t9.id_tir = t7.id_tir
					left join return_to_type as t10 on t10.id_return_to_type = t9.id_return_to_type
					left join return_part as t11 on t11.id_tir = t7.id_tir
					left join fqm_tir as t12 on t12.id_tir = t7.id_tir
						where t5.timestamp_ticket between '".$low."' and '".$high."'
						group by t1.id_ticket asc;";
*/


$query = "select t1.id_ticket, t1.catatan, t1.problem_date, t2.vin_mobil, t1.mileage, t3.tipe_mobil, t4.timestamp_ticket as LTIR_Date, t5.timestamp_ticket as LTIR_Received, t6.timestamp_ticket as LTIR_Replied, t7.timestamp_ticket as judgment_date, t8.tir_jepang, t9.status_tir_jepang, t11.return_part, group_concat( t12.part_name order by t12.id_part separator '; ' ) as part_name, group_concat( DISTINCT t12.arrived_time order by t12.id_part separator '; ' ) as received_date, t11.return_status, t13.fqm_status, t13.fqm_no, t13.reg_date, t13.closed_date, t15.stlogin
				from ticket as t1
			join mobil as t2 on t2.id_mobil = t1.id_mobil
			join tipe_mobil as t3 on t3.id_tipe_mobil = t2.id_tipe_mobil
			join timestamp_ticket as t4 on t4.id_ticket = t1.id_ticket
			left join timestamp_ticket as t5 on ( t5.id_ticket = t1.id_ticket and t5.id_status_ticket = '2' )
			left join timestamp_ticket as t6 on ( t6.id_ticket = t1.id_ticket and t6.id_status_ticket = '2.5' )
			left join timestamp_ticket as t7 on ( t7.id_ticket = t1.id_ticket and t7.id_status_ticket in ('3', '4') )
			left join tir as t8 on t8.id_ticket = t1.id_ticket
			left join status_tir_jepang as t9 on t9.id_tir = t8.id_tir and t9.time_stamp_tir = (select t10.time_stamp_tir from status_tir_jepang as t10 where t10.id_tir = t8.id_tir order by t10.time_stamp_tir desc limit 1)
			left join return_part as t11 on t11.id_tir = t8.id_tir
			left join timestamp_return_part as t12 on t12.id_tir = t8.id_tir
			left join fqm_tir as t13 on t13.id_tir = t8.id_tir
			join user_logbook as t14 on t14.username = t1.username
			join dealer as t15 on t15.id_dealer = t14.id_dealer
				where 	t5.timestamp_ticket > '".$low."' and 
						t5.timestamp_ticket < '".$high."'
				group by t1.id_ticket asc
				order by t5.timestamp_ticket asc;";



$result = mysql_query($query);



		
$i = 3;
$a = 0;

while($row = mysql_fetch_array($result)){

	$i++;
	$a++;
	
// date('ym',strtotime($row['start']))	
	
	$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('A'.$i, $a)
				->setCellValue('B'.$i, strtoupper($row['vin_mobil']))
				->setCellValue('C'.$i, $row['mileage'])
				->setCellValue('D'.$i, $row['tipe_mobil'])
				->setCellValue('E'.$i, 'LOCAL TIR')
				->setCellValue('F'.$i, '#'.$row['id_ticket'])
				->setCellValue('G'.$i, $row['stlogin'])
				->setCellValue('H'.$i, date('ym',strtotime($row['LTIR_Date'])) )
				->setCellValue('I'.$i, $row['catatan'])
				->setCellValue('J'.$i, $row['LTIR_Date'])
				->setCellValue('K'.$i, $row['problem_date'])
				->setCellValue('L'.$i, $row['LTIR_Received'])
				->setCellValue('M'.$i, $row['LTIR_Replied'])
				->setCellValue('N'.$i, $row['status_tir_jepang'])
				->setCellValue('O'.$i, $row['judgment_date'])
				->setCellValue('P'.$i, '?')
				->setCellValue('Q'.$i, '?')
				->setCellValue('R'.$i, $row['tir_jepang'])
				->setCellValue('S'.$i, $row['return_part'])
				->setCellValue('T'.$i, $row['part_name'])
				->setCellValue('U'.$i, $row['received_date'])
				->setCellValue('V'.$i, $row['return_status'])
				->setCellValue('W'.$i, '?')
				->setCellValue('X'.$i, '?')
				->setCellValue('Y'.$i, '?')
				->setCellValue('Z'.$i, '?')
				->setCellValue('AA'.$i, $row['fqm_status'])
				->setCellValue('AB'.$i, $row['fqm_no'])
				->setCellValue('AC'.$i, $row['reg_date'])
				->setCellValue('AD'.$i, $row['closed_date'])
				->setCellValue('AE'.$i, '?');
	
}

			
				
// yang masih problem

//$objPHPExcel->getActiveSheet()->getStyle('P5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
//$objPHPExcel->getActiveSheet()->getStyle('P5')->getFill()->getStartColor()->setARGB('00acacac');
//
//$objPHPExcel->getActiveSheet()->getStyle('X5:AA5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
//$objPHPExcel->getActiveSheet()->getStyle('X5:AA5')->getFill()->getStartColor()->setARGB('00acacac');
//
//$objPHPExcel->getActiveSheet()->getStyle('AD5:AE5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
//$objPHPExcel->getActiveSheet()->getStyle('AD5:AE5')->getFill()->getStartColor()->setARGB('00acacac');


	// resize the width
	for($y = 'A'; $y !== 'AF'; $y++) {
			$objPHPExcel->getActiveSheet()->getColumnDimension($y)->setAutoSize(true);
	}
	
	
	
// make the border line

$objPHPExcel->getActiveSheet()->getStyle('A4:AE'.$i)->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A4:AE'.$i)->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A4:AE'.$i)->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('A4:AE'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

$objPHPExcel->getActiveSheet()->getStyle('A4:A'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('B4:B'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('C4:C'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('D4:D'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('E4:E'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('F4:F'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('G4:G'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('H4:H'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('I4:I'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('J4:J'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('K4:K'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('L4:L'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('M4:M'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('N4:N'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('O4:O'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('P4:P'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Q4:Q'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('R4:R'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('S4:S'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('T4:T'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('U4:U'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('V4:V'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('W4:W'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('X4:X'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Y4:Y'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('Z4:Z'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AA4:AA'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AB4:AB'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AC4:AC'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AD4:AD'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
$objPHPExcel->getActiveSheet()->getStyle('AE4:AE'.$i)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);


			
$objPHPExcel->getActiveSheet()->getStyle('A1:AE'.$i)->getFont()->setName('Verdana')
															->setSize(8)
															->getColor()->setRGB('3c3c3c');
															
$objPHPExcel->getActiveSheet()->getStyle('I1:I'.$i)->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()->getStyle('T1:T'.$i)->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()->getStyle('AE1:AE'.$i)->getAlignment()->setWrapText(true);



// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('TIR-DATA');


// ================================================================= sheet 1 END







$objPHPExcel->getActiveSheet()->getProtection()->setSheet(true); 

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->getActiveSheet()->getProtection()->setSheet(true); 

//$objPHPExcel->getSecurity()->setWorkbookPassword("isuzu_4str4");


// Redirect output to a clientâs web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="TIR-DATA_'.gmdate('Y-M-d').'.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT+7'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0




$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

}

?>