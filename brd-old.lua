--
function get_sets()
	mote_include_version = 2
	include('Mote-Include.lua')
end

--
function job_setup()
	include('Alaza-Include.lua')
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias echo input /item "Echo Drops" <me>; ')
	send_command('alias holy input /item "Holy Water" <me>; ')
	send_command('alias rem input /item "Remedy" <me>; ')

end

--
function user_setup()
	state.OffenseMode:options('Normal')
	set_macro_page(1, 2)
end

--
function job_precast(spell, action, spellMap, eventArgs)

	if spell.action_type == 'Magic' and windower.ffxi.get_spell_recasts()[spell.recast_id] > 0 then
		cancel_spell()
		return
	elseif spell.action_type == 'JobAbility' and windower.ffxi.get_ability_recasts()[spell.recast_id] > 0 then
		cancel_spell()
		return
	elseif spell.action_type == 'BardSong' and windower.ffxi.get_spell_recasts()[spell.recast_id] > 0 then
		cancel_spell()
		return
	end

end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'Pretty', 'PDT')
	
	send_command('bind @F1 input /ma "Fire Threnody II" <t>')
	send_command('bind @F2 input /ma ""Ice Threnody II" <t>')
	send_command('bind @F3 input /ma "Wind Threnody II" <t>')
	send_command('bind @F4 input /ma "Earth Threnody II" <t>')
	send_command('bind @F5 input /ma "Lightning Threnody II" <t>')
	send_command('bind @F6 input /ma "Water Threnody II" <t>')
	send_command('bind @F7 input /ma "Light Threnody II" <t>')
	send_command('bind @F8 input /ma "Dark Threnody II" <t>')
	send_command('bind @F9 input /ma "pining Nocturne" <t>')
	send_command('bind @F10 input /ma "Sentinel\'s Scherzo" <t>')
	send_command('bind @F11 input /ma "hunter\'s prelude" <t>')
	send_command('bind @F12 input /ma "archer\'s prelude" <t>')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "slow" <t>')
	send_command('bind !F2 input /ma "paralyze" <t>')
	send_command('bind !F3 input /ma "silence" <t>')
	send_command('bind !F4 input /ma "foe requiem VII" <t>')
	send_command('bind !F5 input /ma "Stoneskin" <me>')
	send_command('bind !F6 input /ma "sentinel\'s scherzo" <t>')
	send_command('bind !F7 input /ma "valor minuet II" <t>')
	send_command('bind !F8 input /ma "valor minuet V" <t>')
	send_command('bind !F9 input /ma "dextrous etude" <t>')
	send_command('bind !F10 input /ma "blink" <me>')
	send_command('bind !F11 input /ja "pianissimo" <me>')
	send_command('bind !F12 input /ja "troubadour" <me>')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "poisona" <t>')
	send_command('bind ^F2 input /ma "blindna" <t>')
	send_command('bind ^F3 input /ma "silena" <t>')
	send_command('bind ^F4 input /ma "stona" <t>')
	send_command('bind ^F5 input /ma "viruna" <t>')
	send_command('bind ^F6 input /ma "cursna" <t>')
	send_command('bind ^F7 input /ma "valor minuet III" <t>')
	send_command('bind ^F8 input /ma "valor minuet IV" <t>')
	send_command('bind ^F9 input /ma "sinewy etude" <t>')
	send_command('bind ^F10 input /ma "stoneskin" <me>')
	send_command('bind ^F11 input /ma "haste" <t>')
	send_command('bind ^F12 input /ja "nightingale" <me>')

	send_command('bind @1 input /equip range "gjallarhorn"')
	send_command('bind @2 input /equip range "Daurdabla"')
	send_command('bind @3 input /ma "mage\'s ballad" <t>')
	send_command('bind @4 input /ma "fire carol II" <t>')
	send_command('bind @5 input /ma "ice carol II" <t>')
	send_command('bind @6 input /ma "wind carol II" <t>')
	send_command('bind @7 input /ma "earth carol II" <t>')
	send_command('bind @8 input /ma "lightning carol II" <me>')
	send_command('bind @9 input /ma "water carol II" <t>')
	send_command('bind @0 input /ma "light carol II" <t>')
	send_command('bind @- input /ma "dark carol II" <t>')
	send_command('bind @= input /ma "Curaga II" <t>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "paralyna" <t>')
	send_command('bind !2 input /ma "Cure IV" <t>')
	send_command('bind !3 input /ma "erase" <t>')
	send_command('bind !4 input /ma "mage\'s ballad III" <t>')
	send_command('bind !5 input /ma "Curaga" <t>')
	send_command('bind !6 input /ma "victory march" <t>')
	send_command('bind !7 input /ma "blade madrigal" <t>')
	send_command('bind !8 input /ma "foe lullaby II" <t>')
	send_command('bind !9 input /ma "invisible" <t>')
	send_command('bind !0 input /ja "divine seal" <t>')
	send_command('bind !- input /ja "marcato" <me>')
	send_command('bind != input /ja "tenuto" <t>')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Curaga" <t>')
	send_command('bind ^2 input /ma "Cure III" <t>')
	send_command('bind ^3 input /ma "magic finale" <t>')
	send_command('bind ^4 input /ma "mage\'s ballad II" <t>')
	send_command('bind ^5 input /ma "Chocobo mazurka" <t>')
	send_command('bind ^6 input /ma "advancing march" <t>')
	send_command('bind ^7 input /ma "sword madrigal" <t>')
	send_command('bind ^8 input /ma "horde lullaby II" <t>')
	send_command('bind ^9 input /ma "sneak" <t>')
	send_command('bind ^0 input /ma "carnage elegy" <t>')
	send_command('bind ^- input /ja "soul voice" <me>')
	send_command('bind ^= input /ja "clarion call" <me>')

end

--
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
		
		local generalClass = song_type(spell)
		if generalClass and sets.midcast[generalClass] then
			equip(sets.midcast[generalClass])
		end
		
		end
	end
end

--
function song_type(spell)
	if set.contains(spell.targets, 'Enemy') then
		return 'SongDebuff'
	else
		return 'SongBuff'
	end
end

--
function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Offense Mode' then
		if newValue == 'Normal' then
			disable('main', 'sub', 'ammo')
		else
			enable('main', 'sub', 'ammo')
		end
	end
end

--
function init_gear_sets()

sets.resting = { }

sets.Kiting = { feet = "Aoidos' Cothurnes +1" }

sets.precast.FC = {
	main="Grioavolr", 
	sub="umbra strap",
	head="Vanya Hood",
	ear1="Enchanter earring +1",
	ear2="Loquacious Earring",
	neck="baetyl pendant",
	body="Inyanga jubbah +1",
	hands="Gendewitha gages +1",
	ring1="Prolix Ring",
	ring2="Kishar Ring",
	back="Intarabus's Cape",
	waist="Channeler's stone",
	legs="Fili Rhingrave +1",
	feet="Chelona Boots +1"
}
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {neck="Stone Gorget", waist="Siegel Sash"})

sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		main="chatoyant staff",
		sub="Achaq Grip",
		ammo="impatiens",
		head="Kaykaus mitra",
		neck="Incanter's torque",
		ear1="Nourishing earring +1",
		ear2="Mendicant's earring",
		body="Heka's kalasiris", 
		hands="Inyanga Dastanas +1",
		ring1="janniston ring",
		ring2="Sirona's Ring",
		back="twilight cape",
		waist="hachirin-no-obi",
		legs="Kaykaus Tights",
		feet="kaykaus boots"
	})

sets.precast.FC.Curaga = sets.precast.FC.Cure

sets.precast.FC.BardSong = {
	main = "Kali",
	sub = "Genmei Shield", 
	head = "Fili Calot",
	neck = "Aoidos' Matinee",
	ear1 = "Loquac. Earring",
	ear2= "aoidos' earring",
	body = "Fili hongreline",
	hands = "Fili manchettes",
	ring1 = "Prolix Ring",
	back= "Intarabus's Cape",
	legs = "inyanga shalwar +1",
	feet = "brioso slippers +1"
}

sets.SongRecast = {
	hands = "Sheikh Gages",
	legs = "Aoidos' rhingrave +2"
}

sets.midcast.March = set_combine(sets.midcast.SongBuff , sets.SongRecast, { hands="Fili manchettes +1" })
sets.midcast.Finale = set_combine(sets.midcast.SongDebuff, sets.SongRecast)
sets.midcast.Lullaby = set_combine(sets.midcast.SongDebuff, sets.SongRecast)
sets.midcast['Horde Lullaby'] = set_combine(sets.midcast.SongDebuff, sets.SongRecast, { range="Daurdabla" })
sets.midcast['Horde Lullaby II'] = set_combine(sets.midcast.SongDebuff, sets.SongRecast, { range="Daurdabla" })
sets.midcast.Elegy = set_combine(sets.midcast.SongDebuff, sets.SongRecast)
sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff, sets.SongRecast)
sets.midcast.Minne = set_combine(sets.midcast.SongBuff , sets.SongRecast )
sets.midcast.Minuet = set_combine(sets.midcast.SongBuff , sets.SongRecast, { body="Fili Hongreline +1" })
sets.midcast.Madrigal = set_combine(sets.midcast.SongBuff , sets.SongRecast, { head="Fili calot +1", back="Intarabus's cape" })
sets.midcast.Prelude = set_combine(sets.midcast.SongBuff , sets.SongRecast, { back="Intarabus's cape" })
sets.midcast.Mambo = set_combine(sets.midcast.SongBuff , sets.SongRecast)
sets.midcast.Mazurka = set_combine(sets.midcast.SongBuff , sets.SongRecast)
sets.midcast.Ballad = set_combine(sets.midcast.SongBuff , sets.SongRecast, { legs="Fili rhingrave +1" })

sets.midcast.SongBuff = {
	main = "Kali",
	sub = "Genmei Shield", 
	head="Fili calot +1",
	neck="Aoidos' Matinee",
	ear1="Loquac. Earring",
	body="Fili Hongreline +1",
	hands="Fili manchettes +1",
	ring1="Prolix Ring",
	back="Intarabus's cape",
	waist="Salfi belt +1",
	legs="Fili rhingrave +1",
	feet="Fili Cothurnes +1"
}

    sets.engaged = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
        body="Wayfarer Robe",
		hands="Inyanga dastanas +1",
		ring1="Mars's Ring",
		ring2="Spiral ring",
        back="Cheviot Cape",
		waist="Ninurta's Sash",
		legs="Vanya slops",
		feet="Vanya clogs"
	}

sets.midcast.SongDebuff = {
	main = "Kali",
	sub = "Genmei Shield", 
	head="Inyanga Tiara +1",
	neck="Incanter's Torque",
	ear1="Singing Earring",
	ear2="Musical Earring",
	body="Inyanga Jubbah +1",
	hands="Inyanga Dastanas +1",
	ring1="Mediator's Ring",
	ring2="Vertigo Ring",
	back= "Intarabus's Cape",
	waist="Harfner's Sash",
	legs="Inyanga Shalwar +1",
	feet="Inyanga Crackows +1"
}

    sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Achaq Grip",
        head="Kaykaus mitra",
		neck="Incanter's torque",
		ear1="Mendicant's Earring",
		ear2="Novia Earring",
        body="Heka's Kalasiris",
		hands="Inyanga Dastanas +1",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Vita Cape",
		waist="Pythia sash +1",
		legs="Gyve Trousers",
		feet="Kaykaus Boots"
	}

    sets.midcast.Curaga = {
		main="Chatoyant Staff",
		sub="Achaq Grip",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Mendicant's Earring",
		ear2="Novia Earring",
        body="Heka's Kalasiris",
		hands="Inyanga Dastanas +1",
		ring1="Kuchekula ring",
		ring2="Sirona's Ring",
        back="Vita Cape",
		waist="Pythia sash +1",
		legs="Gyve Trousers",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.Cursna = {
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		hands="Inyanga Dastanas +1",
		ring1="Haoma's ring",
		ring2="Haoma's ring",
		feet="Vanya clogs"
	}
	
	 -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Umuthi Hat",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
        body="Anhur Robe",
		hands="Inyanga Dastanas +1",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Portent Pants",
		feet="Kaykaus Boots"
	}
		
    sets.midcast.Stoneskin = {
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Haven Hose"
	}

sets.idle = {
	main="Terra's Staff",
	sub = "Umbra Strap", 
	range="Gjallarhorn",
	head="blistering sallet +1",
	neck="Loricate Torque +1",
	ear1="Moonshade Earring",
	ear2="Odnowa Earring",
	body="Vanya Robe",
	hands="Serpentes cuffs",
	ring1="Defending ring",
	ring2="warden's Ring",
	back="Umbra Cape",
	waist="Slipor Sash",
	legs="Inyanga Shalwar +1",
	feet="Fili Cothurnes +1"
}

sets.Refresh = {
	main = "Terra's Staff",
	sub = "Umbra Strap", 
	head = "Wivre Hairpin",
	neck = "Loricate Torque +1",
	ear1 = "Moonshade Earring",
	ear2 = "Odnowa Earring",
	body = "Vanya Robe",
	hands = "Inyanga Dastanas +1",
	ring1 = "Archon ring",
	ring2 = "Dark Ring",
	back = "Umbra Cape",
	waist = "Slipor Sash",
	legs = "Assiduity pants +1",
	feet = "Inyanga crackows +1"
}

sets.idle.Pretty = {
	main="Chatoyant Staff",
	sub = "Achaq Grip", 
	range = "Oneiros Harp",
	head = "Aoidos' Calot +2",
	neck = "Loricate Torque +1",
	ear1 = "Moonshade Earring",
	ear2 = "Loquac. Earring",
	body = "Sheikh Manteel",
	hands = "Sheikh Gages",
	ring1 = "Dark Ring",
	ring2 = "Shadow Ring",
	back = "Shadow Mantle",
	waist = "Flume Belt",
	legs = "Inyanga Shalwar +1",
	feet = "Fili Cothurnes +1"
}

sets.idle.PDT = {
	main = "Terra's Staff",
	sub = "clemency grip", 
	head = "blistering sallet +1",
	neck = "Loricate Torque +1",
	ear1 = "Moonshade Earring",
	ear2 = "Odnowa Earring",
	body = "Inyanga Jubbah +1",
	hands="Serpentes cuffs",
	ring1="Defending ring",
	ring2="warden's Ring",
	back = "Umbra Cape",
	waist = "Slipor Sash",
	legs = "Inyanga Shalwar +1",
	feet = "Inyanga crackows +1"
}
	

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end

end
