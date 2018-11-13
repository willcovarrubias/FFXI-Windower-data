--Gearswap file for Ranger(FFXI)
--Highly recommend reviewing gearsets and replacing with personal items.
--Also recommend changing key bind keys since everyone's keyboard and play style are different. ^ = CTRL, != ALT.

function job_setup()

	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	
end

function get_sets()

--Keybinds--

--F9 =Ranged Attack/RA
--F10 = Barrage
--F11 = Coronach
--F12 = Last Stand

	send_command('bind f9 input /ra <t>')
	send_command('bind f10 input /ja Barrage <me>')
	send_command('bind f11 input /ws "Coronach" <t>')
	send_command('bind f12 input /ws "Last Stand" <t>')


--CTRL+F9 = RA index toggle
--CTRL+F10 = Barrage index toggle
--CTRL+F11 = RA WS index toggle
--CTRL+F12 = Eagle Eye Shot

	send_command('bind ^f9 gs c toggle RangeTP set')
	send_command('bind ^f10 gs c toggle Barrage set')
	send_command('bind ^f11 gs c toggle Ranged WS sets')
	send_command('bind ^f12 input /ja "Eagle Eye Shot" <t>')

--ALT+F9 = Melee TP toggle
--ALT+F10 = Exen Toggle

	send_command('bind !f9 gs c toggle TP set')
	send_command('bind !f10 gs c toggle Exenterator set')

function file_unload()

	send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')

	send_command('unbind ^f9')
        send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')       

        send_command('unbind !f9')
        send_command('unbind !f10')
        
end 
        
 


--JA Sets for Precast Function--

sets.JA = {}
		
sets.JA['Eagle Eye Shot'] = {
    head="Meghanada Visor +2",
    body="Orion Jerkin +2",
    hands="Orion Bracers +2",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}

sets.JA['Velocity Shot'] = {body="Amini Caban +1"}
sets.JA['Sharpshot'] = {legs="Orion Braccae +2"}
sets.JA['Barrage'] = {hands="Orion Bracers +2"}
sets.JA['Double Shot'] = {head="Amini Gapette +1"}
sets.JA['Shadowbind'] = {hands="Orion Bracers +2"}
sets.JA['Camouflage'] = {body="Orion Jerkin +2"}
sets.JA['Scavenge'] = {feet="Orion Socks +1"}
sets.JA['Bounty Shot'] = {hands="Sylvan Glovettes +2"}
		

--TP set for Melee or solo scenario--

sets.TP = {}
sets.TP.index = {'Reg','Acc','DT'}
TP_Index = 1
		
sets.TP.Reg = {
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Mummu Ring",
    right_ring="Epona's Ring",
    back="Agema Cape",
}
			
sets.TP.Acc = set_combine(sets.TP.Reg,{
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Mummu Ring",
    right_ring="Epona's Ring",
    back="Agema Cape",
})
	
sets.TP.DT = set_combine(sets.TP.Reg,{
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",
})
			
		
--Utility Sets for Snapshot aka Ranged Attack Precast--

sets.Utility = {}

sets.Utility.Snapshot = {
    head="Amini Gapette +1",
    body="Amini Caban +1",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Impulse Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
}

		
--Ranged Attack TP Sets--
sets.RangeTP = {}
sets.RangeTP.index = {'Reg','Acc','BOWSTP'}
RangeTP_Index = 1
				
sets.RangeTP.Reg = {
    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
    body="Orion Jerkin +2",
    hands="Meg. Gloves +2",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}  
			
sets.RangeTP.Acc = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Orion Bracers +2",
    legs="Orion Braccae +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}  
	
sets.RangeTP.BOWSTP = {
    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
    body="Orion Jerkin +2",
    hands="Amini Glove. +1",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}  
	
	--Barrage--           
sets.Barrage = {}
sets.Barrage.index = {'Reg','Acc'}
Barrage_Index = 1
               
 sets.Barrage.Reg = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Orion Bracers +2",
    legs="Orion Braccae +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}
						
sets.Barrage.Acc = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Orion Bracers +2",
    legs="Orion Braccae +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Kwahu Kachina Belt",
    left_ear="Enervating Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
}
		
--Exenterator Sets--
		
sets.Exen = {}
sets.Exen.index = {'Reg','Acc'}
Exen_Index = 1
		
sets.Exen.Reg = set_combine(sets.TP.Reg,{neck="Fotia Gorget",
	ring1="Stormsoul Ring",ring2="Stormsoul Ring",waist="Fotia Belt"})
		
sets.Exen.Acc = set_combine(sets.TP.Acc,{neck="Fotia Gorget",waist="Fotia Belt"})
		
		
--Ranged WS Sets--
			
--Coronach/Namas Arrow/Sidewinder/Slug Shot/Refulgent Arrow--		
sets.Coronach = {}
sets.Coronach.index = {'Reg','Acc'}
Coronach_Index = 1
				
sets.Coronach.Reg = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
						
sets.Coronach.Acc = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}


--Wildfire/Trueflight Sets--
sets.Wildfire = {}
sets.Wildfire.index = {'Reg','Acc'}
Wildfire_Index = 1
				
sets.Wildfire.Reg = {
    head="Orion Beret +3",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','STR+4','Mag. Acc.+11',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+15',}},
    neck="Sanctity Necklace",
    waist="Yamabuki-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Weather. Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
						
sets.Wildfire.Acc = {
    head="Orion Beret +3",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','STR+4','Mag. Acc.+11',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+15',}},
    neck="Sanctity Necklace",
    waist="Yamabuki-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Weather. Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}		
		
--Last Stand/Apex Arrow Sets--
sets.LastS = {}
sets.LastS.index = {'Reg','Acc'}
LastS_Index = 1
		
sets.LastS.Reg = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
		
sets.LastS.Acc = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

--Jishnu's Radiance / Heavy Shot / Arching Arrow Sets --
-- Jishnu's has a dex modifier, but Range Attack crits are modified by AGI--
		
sets.Jishnu = {}
sets.Jishnu.index = {'Reg','Acc'}
Jishnu_Index = 1
		
sets.Jishnu.Reg = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
				
sets.Jishnu.Acc = {
    head="Orion Beret +3",
    body="Orion Jerkin +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Telos Earring",
    left_ring="Mummu Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}				
end



--Precast Functions for JAs, Ranged Attacks, and Weaponskills--

function precast(spell,act)
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end
	
	if spell.name == "Ranged" then
		equip(sets.Utility.Snapshot)
	end

--Weaponskill sets coupled based on Stat Attribute Modifier/Crit Modifier--
		
	if spell.english == "Coronach" or spell.english == "Namas Arrow" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Slug Shot" or spell.english == "Sidewinder" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Refulgent Arrow" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Jishnu's Radiance" then
		equip(sets.Jishnu[sets.Jishnu.index[Jishnu_Index]])
	end
	
	if spell.english == "Heavy Shot" or spell.english == "Arching Arrow" then
		equip(sets.Jishnu[sets.Jishnu.index[Jishnu_Index]])
	end	
	
	if spell.english == "Wildfire" or spell.english == "Trueflight" then
		equip(sets.Wildfire[sets.Wildfire.index[Wildfire_Index]])
	end
	
	if spell.english == "Last Stand" or spell.english == "Apex Arrow" then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
	end
	
	if spell.english == "Detonator" or spell.english == "Empyreal Arrow" then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
	end
	
	if spell.english == "Exenterator" then
		equip(sets.Exen[sets.Exen.index[Exen_Index]])
	end
end

--Midcast functions to equip midshot sets for Ranged Attacks and when Barrage is active--
--Mirror's Precast to ensure desired effects are applied--

function midcast(spell,act)
        if spell.name == "Ranged" then
                if buffactive.Barrage then
                      equip(sets.Barrage[sets.Barrage.index[Barrage_Index]])
                else
                       equip(sets.RangeTP[sets.RangeTP.index[RangeTP_Index]])
                end
        end

	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end

	--Weaponskill sets coupled based on Stat Attribute Modifier/Crit Modifier--
		
	if spell.english == "Coronach" or spell.english == "Namas Arrow" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Slug Shot" or spell.english == "Sidewinder" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Refulgent Arrow" then
		equip(sets.Coronach[sets.Coronach.index[Coronach_Index]])
	end
	
	if spell.english == "Jishnu's Radiance" then
		equip(sets.Jishnu[sets.Jishnu.index[Jishnu_Index]])
	end
	
	if spell.english == "Heavy Shot" or spell.english == "Arching Arrow" then
		equip(sets.Jishnu[sets.Jishnu.index[Jishnu_Index]])
	end	
	
	if spell.english == "Wildfire" or spell.english == "Trueflight" then
		equip(sets.Wildfire[sets.Wildfire.index[Wildfire_Index]])
	end
	
	if spell.english == "Last Stand" or spell.english == "Apex Arrow" then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
	end
	
	if spell.english == "Detonator" or spell.english == "Empyreal Arrow" then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
	end
	
	if spell.english == "Exenterator" then
		equip(sets.Exen[sets.Exen.index[Exen_Index]])
	end	

 end

--Aftercast function, returns user to TP/Melee set after action is complete--

function aftercast(spell,act)

	if player.status == 'Engaged' then	
		equip(sets.TP[sets.TP.index[TP_Index]])
	else
		equip(sets.TP[sets.TP.index[TP_index]])
	end
	
end

function buff_change(new,old)
        if buffactive['Barrage'] then
                equip(sets.JA['Barrage'])
        end
 end
 
--Status Change function, switches user to TP set upon engaging--
 
function status_change(new,old)
 
        if player.status == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_index]])
        else
                equip(sets.TP[sets.TP.index[TP_index]])
        end
 
        if buffactive['Barrage'] and new == 'Engaged' then
                equip(sets.JA['Barrage'])
        end
end


--Toggle Command functions--
--Gearswap direct command = //gs c toggle 'x' set
--Macro line = /console gs c toggle x set
--ex: /console gs c toggle RangeTP set
-- Index is set to 1 or 'Reg', press button once to switch to 'Acc', and so on.

function self_command(command)
	
	if command == 'toggle TP set' then
	TP_Index = TP_Index +1
	if TP_Index > #sets.TP.index then TP_Index = 1 end
	send_command('@input /echo >>> TP Set Changed to: '..sets.TP.index[TP_Index]..' ')
	equip(sets.TP[sets.TP.index[TP_Index]])

	elseif command == 'toggle RangeTP set' then
	RangeTP_Index = RangeTP_Index +1
	if RangeTP_Index > #sets.RangeTP.index then RangeTP_Index = 1 end
	send_command('@input /echo >>> Range TP set changed to: '..sets.RangeTP.index[RangeTP_Index]..' ')
	equip(sets.RangeTP[sets.RangeTP.index[RangeTP_Index]])
	
	elseif command == 'toggle Barrage set' then
	Barrage_Index = Barrage_Index +1
	if Barrage_Index > #sets.Barrage.index then Barrage_Index = 1 end
	send_command('@input /echo >>> Barrage Set Changed to: '..sets.Barrage.index[Barrage_Index]..' ')
	equip(sets.Barrage[sets.Barrage.index[Barrage_Index]])
	
	elseif command == 'toggle Ranged WS sets' then
	Coronach_Index = Coronach_Index +1
	if Coronach_Index > #sets.Coronach.index then Coronach_Index = 1 end
	Wildfire_Index = Wildfire_Index +1
	if Wildfire_Index > #sets.Wildfire.index then Wildfire_Index = 1 end
	LastS_Index = LastS_Index +1
	if LastS_Index > #sets.LastS.index then LastS_Index = 1 end	
	Jishnu_Index = Jishnu_Index +1
	if Jishnu_Index > #sets.Jishnu.index then Jishnu_Index = 1 end
	send_command('@input /echo >>>Ranged WS sets changed to: '..sets.Jishnu.index[Jishnu_Index]..' ')
	
	
	elseif command == 'toggle Exenterator set' then
	Exen_Index = Exen_Index +1
	if Exen_Index > #sets.Exen.index then Exen_Index = 1 end
	send_command('@input /echo >>> Exenterator Set Changed to: '..sets.Exen.index[Exen_Index]..' ')
	equip(sets.Exen[sets.Exen.index[Exen_Index]])
	end
end