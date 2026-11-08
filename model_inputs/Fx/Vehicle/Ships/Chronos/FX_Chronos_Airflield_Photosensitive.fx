{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 3.6,
			"scaleY": 3.6,
			"scaleZ": 3.6,
			"children": [
				{
					"type": "object",
					"name": "Lights",
					"children": [
						{
							"type": "model",
							"name": "PlanePivCenter",
							"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
							"x": -1.0266,
							"y": 0.10354,
							"z": 2.87863,
							"scaleX": 0.27,
							"scaleY": 0.24,
							"scaleZ": 0.22,
							"rotationX": 90,
							"rotationZ": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 15
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Triangle.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "model",
							"name": "PlanePivCenter",
							"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
							"x": -1.0266,
							"y": 0.10354,
							"z": 3.56065,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"rotationX": 90,
							"rotationZ": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 15
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Triangle.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "model",
							"name": "PlanePivCenter",
							"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
							"x": 1.38063,
							"y": -0.49775,
							"z": 3.99742,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"rotationX": 90,
							"rotationZ": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 15
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Triangle.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Right",
							"x": 0.49833,
							"y": 0.83424,
							"z": 0.7503375000000001,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 3.885780586188048e-16,
									"y": 8.881784197001252e-16,
									"z": 2.2211899999999987,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6499999999999997,
									"rotationX": -1.1199556842968924e-19,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": 0.84329,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 1.1102230246251565e-16,
									"y": 2.220446049250313e-16,
									"z": -0.46392,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6499999999999999,
									"rotationX": -3.7331856143229744e-20,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -1.82116,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Left",
							"x": 2.25661,
							"y": 0.83424,
							"z": 0.75032,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 3.885780586188048e-16,
									"y": 8.881784197001252e-16,
									"z": 2.2211899999999987,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6499999999999997,
									"rotationX": -1.1199556842968924e-19,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": 0.84329,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 1.1102230246251565e-16,
									"y": 2.220446049250313e-16,
									"z": -0.46392,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6499999999999999,
									"rotationX": -3.7331856143229744e-20,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -1.82116,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Lefts",
							"enabled": false,
							"x": 2.24783,
							"y": 0.83424,
							"z": 0.75034,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.46392,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": 0.84329,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": 2.22119,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -1.82116,
									"scaleX": 0.6500000000000002,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 1
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Cronos_Lights",
							"source": "Fx/Meshes_Common/Cronos_Lights.fbx",
							"x": 0.08087,
							"y": -0.98167,
							"rotationX": -90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Idle.fbx"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.36,
								"scale": 0.17,
								"power": 0.25,
								"color": [
									0.8784313725490196,
									1,
									0.8117647058823529
								]
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Chronos.root.B_ROOT.B_Body"
				}
			]
		}
	]
}