{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
			"rotationZ": 180,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Elec",
					"scaleX": 0.25,
					"scaleY": 0.25,
					"scaleZ": 0.25,
					"children": [
						{
							"type": "trails",
							"name": "Trails_sparkles",
							"startWidth": 2,
							"endWidth": 2,
							"lifetime": 3,
							"minSpeed": 0.000001,
							"maxSpeed": 10000000,
							"uvMode": "ETileFixed",
							"uvStretch": 0.0325,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"drawOrder": "100",
											"emissive": 5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 4,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0.1,
										"texture": "Fx/Alphas/T_circle5.png"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.580392156862745,
											0.4549019607843137,
											0.9921568627450981
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 0.25,
										"texture": "Fx/Alphas/Dust05.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.25,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.18649688620478116,
													"value": 0,
													"prevHandle": {
														"dv": -0.5093725273045993,
														"dt": -0.5364309152591755
													},
													"nextHandle": {
														"dv": 0.03536535143684266,
														"dt": 0.038429033446780086
													}
												},
												{
													"time": 0.23183110575281962,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.27444527212797587,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.32592347380674036,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.43810237138260394,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6999930556899353,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0.05
										],
										"uvShiftSpeed": [
											0,
											0.1
										]
									}
								}
							]
						},
						{
							"type": "trails",
							"name": "Trails_tiling",
							"startWidth": 2,
							"endWidth": 2,
							"lifetime": 1.5,
							"minSpeed": 0.000001,
							"maxSpeed": 10000000,
							"uvMode": "ETileFixed",
							"uvStretch": 0.05,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"drawOrder": "100",
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"useSourceUVs": false,
										"blendBetweenFrames": true,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
										"speed": 13,
										"frameDivision": [
											1,
											4
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": true
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.580392156862745,
											0.4549019607843137,
											0.9921568627450981
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.09699974746828972,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.10699974746828972,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.16040496176861682,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.1730265765650571,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.23856694647606427,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.254296635254706,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/clouds_Dissolve.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.1490743044321014,
													"value": 1,
													"prevHandle": {
														"dv": 1.4799152539531057,
														"dt": -0.4848407179172708
													},
													"nextHandle": {
														"dv": -0.09630571539104382,
														"dt": 0.03173395368362694
													}
												},
												{
													"time": 0.19440852398013989,
													"value": 0.35,
													"mode": 2
												},
												{
													"time": 0.23702269035529616,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3095574416321575,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.42590877862297016,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Sphere",
							"source": "Fx/Meshes_Common/Sphere.fbx",
							"enabled": false,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255
										}
									}
								}
							]
						}
					]
				}
			]
		}
	]
}