////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.html.staticControls
{
	import org.apache.flex.core.IDataGridModel;
	import org.apache.flex.core.UIBase;
	
	[Event(name="change", type="org.apache.flex.events.Event")]
	
	/**
	 *  The DataGrid class displays a collection of data using columns and rows. Each
	 *  column represents a specific field in the data set; each row represents a specific
	 *  datum. The DataGrid is a composite component built with a org.apache.flex.html.staticControls.ButtonBar 
	 *  for the column headers and a org.apache.flex.html.staticControls.List for each column. The DataGrid's 
	 *  view bead (usually org.apache.flex.html.staticControls.beads.DataGridView) constructs these parts while 
	 *  itemRenderer factories contruct the elements to display the data in each cell.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public class DataGrid extends UIBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function DataGrid()
		{
			super();
		}
		
		/**
		 *  The array of org.apache.flex.html.staticControls.supportClasses.DataGridColumns used to 
		 *  describe each column.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get columns():Array
		{
			return IDataGridModel(model).columns;
		}
		public function set columns(value:Array):void
		{
			IDataGridModel(model).columns = value;
		}
		
		/**
		 *  The object used to provide data to the org.apache.flex.html.staticControls.DataGrid.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get dataProvider():Object
		{
			return IDataGridModel(model).dataProvider;
		}
		public function set dataProvider(value:Object):void
		{
			IDataGridModel(model).dataProvider = value;
		}
		
		/**
		 *  The currently selected row.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get selectedIndex():int
		{
			return IDataGridModel(model).selectedIndex;
		}
	}
}