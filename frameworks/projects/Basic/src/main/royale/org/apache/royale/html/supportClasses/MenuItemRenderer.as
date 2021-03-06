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
package org.apache.royale.html.supportClasses
{
	import org.apache.royale.core.ISelectableItemRenderer;
	import org.apache.royale.html.Label;
	import org.apache.royale.html.beads.ITextItemRenderer;

	/**
	 * The MenuItemRenderer class is the default itemRenderer for Menus.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9
	 */
	public class MenuItemRenderer extends DataItemRenderer implements ITextItemRenderer
	{
		/**
		 * Constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9
		 */
		public function MenuItemRenderer()
		{
			typeNames = "MenuItemRenderer";
			super();
		}
		
		/**
		 * A place to show the label
		 */
		private var label:Label;
		
		/**
		 * A place to show the sub-menu indicator
		 */
		private var submenuIndicator:Label;
		private var showingIndicator:Boolean = false;
		
		override public function addedToParent():void
		{
			super.addedToParent();
			
			label = new Label();
			label.typeNames = "MenuItemLabel";
			addElement(label);
			
			submenuIndicator = new Label();
			submenuIndicator.typeNames = "MenuItemSubmenuIndicator";
			submenuIndicator.text = "▶";
		}
		
		/**
		 *  Sets the data value and uses the String version of the data for display.
		 *
		 *  @param Object data The object being displayed by the itemRenderer instance.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9
		 */
		override public function set data(value:Object):void
		{
			super.data = value;
			var text:String;
			if (value is String) text = value as String;
			else if (labelField) text = String(value[labelField]);
			else if (dataField) text = String(value[dataField]);
			else text = String(value);
			
			label.text = text;
			
			if (labelField || dataField) {
				if (value.hasOwnProperty("children")) {
					if (!showingIndicator) addElement(submenuIndicator);
					showingIndicator = true;
				} else {
					if (showingIndicator) removeElement(submenuIndicator);
					showingIndicator = false;
				}
			}
		}
		
		/**
		 * The label of the itemRenderer, if any.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9
		 */
		public function get text():String
		{
			return label.text;
		}
		public function set text(value:String):void
		{
			label.text = text;
		}
		
		/**
		 * @private
		 */
		override public function adjustSize():void
		{
			var cy:Number = height/2;
			
			label.x = 0;
			label.y = cy - label.height/2;
			
			if (showingIndicator) {
				submenuIndicator.x = width - submenuIndicator.width;
				submenuIndicator.y = cy - submenuIndicator.height/2;
			}
			
			updateRenderer();
		}
	}
}