<?php
	session_start();
	include("../src/dbconnect.php");
	
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

// create new sheet
//$objPHPExcel->createSheet();


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
			
// add dynamic value
$query_1_1 = "select";




// ================================================================= sheet 1 END


?>