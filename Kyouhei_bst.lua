	-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

include('Kyouhei-Include.lua')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Normal', 'NoPet', 'Both', 'None')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PetMelee', 'PetPDT')
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'HighAcc', 'MaxAcc',}
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

	-- Debuffs ALT	
	send_command('bind !1 input /pet "Fight" <t>')
	send_command('bind !2 input /pet "Heel" <me>')
	send_command('bind !3 input /pet "Stay" <me>')
	send_command('bind !4 input /Reward; input /echo --REWARD--')
	send_command('bind !5 input /ja "Dawn Mulsum" <me>; input /echo --MULSUM--')
	send_command('bind !6 input /pet "Spur" <me>; input /echo --SPUR--')
	send_command('bind !7 input input /ma "" <t>')
	send_command('bind !8 input input /ma "" <t>')
	send_command('bind !9 input input /ma "" <t>')
	send_command('bind !0 input input /ma "" <t>')
	send_command('bind !- gs c cycle EngagedMode; input /echo Engaged Mode Change')
	send_command('bind != gs c cycle IdleMode; input /echo Idle Mode Change')
	
	
	send_command('bind !F12 gs c cycle OffenseMode')

-- Misc CTRL	
	send_command('bind ^1 input /bstpet 1 <me>; /echo --Ready 1--')
	send_command('bind ^2 input /bstpet 2 <me>; /echo --Ready 2--')
	send_command('bind ^3 input /bstpet 3 <me>; /echo --Ready 3--')
	send_command('bind ^4 input /bstpet 4 <me>; /echo --Ready 4--')
	send_command('bind ^5 input /bstpet 5 <me>; /echo --Ready 5--')
	send_command('bind ^6 input /bstpet 6 <me>; /echo --Ready 6--')
	send_command('bind ^7 input /bstpet 7 <me>; /echo --Ready 7--')
	send_command('bind ^8 input /ma "" <t>')
	send_command('bind ^9 input /ma "" <t>')
	send_command('bind ^0 input /ma "" <t>')
	send_command('bind ^- input /ma "Utsusemi: Ni" <me>')
	send_command('bind ^= input /ma "Utsusemi: Ichi" <me>')

end

ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
    'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
    'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
    'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
    'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
    'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
    'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
    'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
    'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
    'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
    'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
    'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
    'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
    'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Frogkick','Ripper Fang','Scythe Tail','Chomp Rush'}
 
       
mab_ready_moves = S{
     'Cursed Sphere','Venom','Toxic Spit',
     'Venom Spray','Bubble Shower',
     'Fireball','Plague Breath',
     'Snow Cloud','Acid Spray','Silence Gas','Dark Spore',
     'Charged Whisker','Purulent Ooze','Aqua Breath','Stink Bomb',
     'Nectarous Deluge','Nepenthic Plunge','Foul Waters','Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
     'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field',
     'Sandpit','Sandblast','Filamented Hold',
     'Spore','Infrasonics','Chaotic Eye',
     'Blaster','Intimidate','Noisome Powder','TP Drainkiss','Jettatura','Spider Web',
     'Corrosive Ooze','Molting Plumage','Swooping Frenzy',
     'Pestilent Plume',}


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
		sets.precast.FC = {
			neck="Orunmila's Torque",
			ear1="Enchanter earring +1",
			ear2="Loquacious Earring",
			hands="Leyline Gloves",
			ring1="Prolix ring", 
			ring2="Evanescence ring",
			waist="Ninurta's Sash"
		}
        
    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    --sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Telchine Cap"})

	--sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {neck="Diemer gorget", ear1="Nourishing earring +1"})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Ames",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
   
        sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
       
        sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves +1",body="Mirke Wardecors",}
       
        sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
       
        sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
       
        sets.precast.JA.Tame = {head="Totemic Helm +1",}
       
        sets.precast.JA.Spur = {feet="Nukumi Ocreae"}
		
		sets.precast.JA.Reward = {
			--main={name="Grioavolr", priority=16},
			ammo="Pet Food Theta",
			head="Stout Bonnet",
			neck="Aife's Medal",
			ear1="Lifestorm Earring",
			ear2="Pratik Earring",
			body="Totemic Jackcoat",
			hands="Ogre Gloves +1",
			ring1="Leviathan Ring",
			ring2="Rufescent Ring",
			back="Pastoralist's Mantle",
			waist="Engraved Belt",
			legs="Totemic Trousers",
			feet="Loyalist Sabatons"
		}
	

		sets.precast.JA.Charm = {
			--main={name="Grioavolr", priority=16},
			--sub={name="Enki Strap", priority=15},
			ammo="Tsar's Egg",
			head="Blistering Sallet +1",
			neck="Dualism Collar +1",
			ear1="Enchanter's Earring",
			ear2="Enchanter Earring +1",
			body="Totemic Jackcoat",
			hands="Ankusa Gloves +1",
			ring1="Dawnsoul Ring",
			ring2="Dawnsoul Ring",
			back=Primal_back,
			waist="Aristo Belt",
			legs="Totemic Trousers",
			feet="Totemic Gaiters"
		}	

		
		
    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    	sets.precast.Waltz = {
			ammo="Tsar's Egg",
			head="Valorous Mask",
			neck="Ferine Necklace",
			ear1="Rimeice Earring",
			ear2="Enchanter Earring +1",
			body="Tali'ah manteel +1",
			hands="Ankusa Gloves +1",
			ring1="Dawnsoul Ring",
			ring2="Dawnsoul Ring",
			back=Primal_back,
			waist="Aristo Belt",
			legs="Valorous Hose",
			feet="Amm Greaves"
		}
    
    -- Weaponskill sets

     sets.precast.WS = {

        head="Argosy Celata +1",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Argosy Mufflers +1",
		ring1="Ifrit Ring +1",
		ring2="Epona's Ring",
        back=STR_WS_back,
		waist="Windbuffet Belt +1",
		legs="Argosy Breeches +1",
		feet="Argosy Sollerets +1"
	}

    sets.precast.WS['Rampage'] = {

        head="Argosy Celata +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Argosy Mufflers +1",
		ring1="Ifrit Ring +1",
		ring2="Epona's Ring",
        back=STR_DA_back,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Argosy Sollerets +1"
	}
	
    sets.precast.WS['Calamity'] = {

        head="Argosy Celata +1",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Meghanada Gloves +2",
		ring1="Ifrit Ring +1",
		ring2="Epona's Ring",
        back=STR_WS_back,
		waist="Windbuffet Belt +1",
		legs="Argosy Breeches +1",
		feet="Argosy Sollerets +1"
	}

    sets.precast.WS['Mistral Axe'] = {

        head="Argosy Celata +1",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Meghanada Gloves +2",
		ring1="Ifrit Ring +1",
		ring2="Epona's Ring",
        back=STR_WS_back,
		waist="Windbuffet Belt +1",
		legs="Argosy Breeches +1",
		feet="Argosy Sollerets +1"
	}

    sets.precast.WS['Bora Axe'] = {
		ammo="Cheruski Needle",
        head="Argosy Celata +1",
		neck="Caro Necklace",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Meghanada Gloves +2",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
        back=Onslaught_back,
		waist="Windbuffet Belt +1",
		legs="Argosy Breeches +1",
		feet="Argosy Sollerets +1"
	}

    sets.precast.WS['Ruinator'] = {
		ammo="Floestone",
        head="Argosy Celata +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Nzingha Cuirass",
		hands="Argosy Mufflers +1",
		ring1="Ifrit Ring +1",
		ring2="Epona's Ring",
        back=STR_DA_back,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Argosy Sollerets +1"
	}
	
    sets.precast.WS['Primal Rend'] = {
		ammo="Pemphredo Tathlum",
        head=MAB_head,
        neck="Baetyl Pendant",
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
        body=MAB_body,
        hands=MAB_hands,
        ring1="Acumen Ring",
		ring2="Fenrir Ring +1",
        back=Primal_back,
        waist="Eschan Stone",
        legs=MAB_legs,
        feet=MAB_feet
	}

    sets.precast.WS['Cloudsplitter'] = sets.precast.WS['Primal Rend']

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
   
   -- Midcast sets for pet actions

	sets.midcast.Pet.ReadyRecast = {sub={name="Charmer's Merlin", priority=15},legs="Desultor Tassets",}
	
   sets.midcast.Pet.WS= {
			main={name="Skullrender", priority=16},
			sub={name="Skullrender", priority=15},
			ammo="Demonry Core",
            neck="Shulmanu Collar",
            ear1="Enmerkar Earring",
			ear2="Domesticator's Earring",
            head="Valorous Mask",
            body="Valorous Mail",
            hands="Nukumi Manoplas",
            legs="Valorous hose",
            feet="Valorous greaves",
            back="Pastoralist's Mantle",
			ring1={name="Varar Ring", priority=16},
			ring2={name="Varar Ring", priority=15},
            waist="Incarnation Sash", 
		} 
  
    sets.midcast.Pet.Neutral = sets.midcast.Pet.WS
           
    sets.midcast.Pet.HighAcc = sets.midcast.Pet.WS
           
    sets.midcast.Pet.MaxAcc = sets.midcast.Pet.WS
	
	
    -- Sets to return to when not performing an action.
    
    
    -- Idle sets
	
	--Player PDT
    sets.idle = {
		main={name="Skullrender", priority=16},
		sub={name="Skullrender", priority=15},
        head="Anwig Salade",
		neck="Loricate Torque +1",
		ear1="Odnowa earring +1",
		ear2="Enmerkar Earring",
		body="Meghanada cuirie +2",
		hands="Meghanada gloves +2",
		ring1="Defending Ring",
		ring2="Vocane Ring",
        back="Umbra Cape",
		waist="Isa Belt",
		legs="Meghanada Chausses +2",
		feet="Amm Greaves"
	}

	--Pet Meele Set	
    sets.idle.PetMelee = {
		main={name="Skullrender", priority=16},
		sub={name="Skullrender", priority=15},
		 ammo="Demonry Core",
         neck="Empath Necklace",
         ear1="Enmerkar Earring",
		 ear2="Domesticator's Earring",
         head="Valorous Mask",
         body="Valorous Mail",
         hands="Nukumi Manoplas",
         back="Pastoralist's Mantle",
		 ring1={name="Varar Ring", priority=16},
		 ring2={name="Varar Ring", priority=15},
         waist="Incarnation Sash",
		 legs="Valorous hose",
         feet="Valorous greaves"
	}

	sets.idle.PDT = {
		main={name="Terra's Staff", priority=16},
		sub={name="Umbra Strap", priority=15},
        head="Blistering Sallet +1",
		neck="Loricate Torque +1",
		ear1="Odnowa earring +1",
		ear2="Odnowa earring",
        body="Meghanada cuirie +2",
		hands="Meghanada gloves +2",
		ring1="Defending Ring",
		ring2="Vocane Ring",
        back="Visucius's mantle",
		waist="Isa Belt",
		legs="Meghanada chausses +2",
		feet="Amm Greaves"
	}

	sets.idle.PetPDT = {
		main={name="Astolfo", priority=16},
		sub={name="Guichard's Axe +2", priority=15},
		main="Midnights",
        head="Anwig Salade",
		neck="Loricate Torque +1",
		ear1="Rimeice earring",
		ear2="Enmerkar earring",
        body="Rao togi",
		hands="Rao kote",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Visucius's mantle",
		waist="Isa Belt",
		legs="Rao haidate",
		feet="Rao sune-ate"
	}     
    	  
    
    sets.Kiting = {feet="Hermes's sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
	--STP', 'Both', 'PetPDT', 'BothPDT'
    sets.engaged = {
		main={name="Skullrender", priority=16},
		sub={name="Skullrender", priority=15},
        head="Valorous Mask",
		neck="Empath necklace",
        ear1="Enmerkar Earring",
		ear2="Domesticator's Earring",
        body="Valorous Mail",
		hands="Valorous Mitts",
		ring1={name="Varar Ring", priority=16},
		ring2={name="Varar Ring", priority=15},
        back="Visucius's mantle",
		waist="Klouskap Sash",
		legs="Valorous hose",
        feet="Valorous greaves"
	}

	sets.engaged.NoPet = {
		ammo="Ginsen",
        head="Blistering Sallet +1",
		neck="Lissome Necklace",
		ear1="Suppanomimi",
		ear2="Brutal earring",
        body="Valorous Mail",
		hands="Valorous Manoplas",
		ring1="Petrov ring",
		ring2="Epona's ring",
        back="Visucius's mantle",
		waist="Klouskap Sash",
		legs="Herculean trousers",
		feet="Valorous greaves"
	}

	sets.engaged.Both= {
        head="Rao kabuto",neck="Empath necklace",ear1="Handler's earring",ear2="Handler's earring +1",
        body="Rao togi",hands="Rao kote",ring1="Eihwaz ring",ring2="Defending Ring",
        back="Visucius's mantle",waist="Flume belt",legs="Rao haidate",feet="Rao sune-ate"}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
 
     
   
 
-- Define class for Sic and Ready moves.
        if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
                classes.CustomClass = "WS"
        equip(sets.midcast.Pet.ReadyRecast)
        end
end
 
 
 
function job_pet_midcast(spell, action, spellMap, eventArgs)
 
   
        end
-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
 
if spell.type == "Monster" and not spell.interrupted then
 
 equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))
 
    if mab_ready_moves:contains(spell.english) and pet.status == 'Engaged' then
 equip(sets.midcast.Pet.MabReady)
 end
 
    if buffactive['Unleash'] then
                hands={ name="Valorous Mitts", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Store TP"+10','System: 1 ID: 1792 Val: 13','Pet: Accuracy+3 Pet: Rng. Acc.+3',}}
        end
 
 
 eventArgs.handled = true
 end
 
 
end
 
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Correlation Mode' then
        state.CorrelationMode:set(newValue)
    end
end



-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.