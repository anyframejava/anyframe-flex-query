/*
 * Copyright 2008-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.anyframe.plugin.flex.query.httpservice.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.anyframe.plugin.flex.query.httpservice.service.CatalogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("catalogController")
@RequestMapping("/catalog.do")
public class CatalogController {
	
	@Inject
	@Named("catalogService")
	private CatalogService catalogService;
	
	@RequestMapping(params = "method=getProduct")
	public String getProduct(Model model)throws Exception{
		List<Map<String, Object>> resultList = catalogService.getProduct();
		model.addAttribute("productList", resultList);
		return "flex-query/httpservice/catalog";
	}
}
