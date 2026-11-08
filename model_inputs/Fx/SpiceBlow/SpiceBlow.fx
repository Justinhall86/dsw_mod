{
	"type": "fx",
	"duration": 1,
	"cullingRadius": 4,
	"children": [
		{
			"type": "advancedDecal",
			"name": "advancedDecal",
			"scaleX": 5.08,
			"scaleY": 5.08,
			"scaleZ": 0.85,
			"rotationZ": 180,
			"albedoMap": "Environment/Asset/SpiceBlow/SpiceBlow_Albedo.png",
			"normalMap": "Environment/Asset/SpiceBlow/SpiceBlow_Normal.png",
			"pbrMap": "Environment/Asset/SpiceBlow/SpiceBlow_MetallicGlossAO.png",
			"children": [
				{
					"type": "subFX",
					"name": "FX_SpiceBlow_Idle",
					"source": "Fx/SpiceBlow/FX_SpiceBlow_Idle.fx",
					"scaleX": 0.04,
					"scaleY": 0.04,
					"scaleZ": 0.2,
					"rotationZ": -180
				},
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"enabled": false,
					"props": {
						"alpha": 1
					},
					"isInstance": true,
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.874567059347126,
									"value": 0.8541666666666666,
									"mode": 0,
									"prevHandle": {
										"dv": 0.14583333333333337,
										"dt": -0.10717969436046015
									},
									"nextHandle": {
										"dv": -0.10831912774342324,
										"dt": 0.07960876117667487
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.21875000000000003,
										"dt": -0.017651788972770532
									},
									"nextHandle": {
										"dv": -0.4625237573981474,
										"dt": 0.035811577193116215
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorMult",
					"source": "shaders/ColorMult.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0,
							0
						]
					},
					"isInstance": true,
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
									"time": 0.26,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "Dissolve",
					"source": "shaders/Dissolve.hx",
					"props": {
						"progress": 0.5,
						"saturation": 1,
						"width": 0.85,
						"useAlpha": true
					},
					"isInstance": true,
					"children": [
						{
							"type": "curve",
							"name": "progress",
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.5599498969968002,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.17235933975087206
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16097399358246126
									}
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
					"type": "curve",
					"name": "scale",
					"keyMode": 0,
					"keys": [
						{
							"time": 0,
							"value": 1,
							"mode": 2
						},
						{
							"time": 0.6,
							"value": 1,
							"mode": 0,
							"prevHandle": {
								"dv": 0,
								"dt": -0.19999999999999998
							},
							"nextHandle": {
								"dv": 0,
								"dt": 0.13333333333333333
							}
						},
						{
							"time": 1,
							"value": 0.7,
							"mode": 2
						}
					]
				}
			]
		}
	]
}