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

include('Elder-Include.lua')

    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Acc', 'PDT')
    state.CastingMode:options('Normal', 'MB', 'Forever', 'ForeverMB')
	state.IdleMode:options('Idle', 'Refresh')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	gear.default.obi_waist = "Eschan Stone"

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience orb", 
	head=gear.merlinicHood_FC, neck="Baetyl Pendant",ear1="Loquacious earring",ear2="Etiolation earring", 
	body=gear.merlinicJubbah_FC,hands=gear.merlinicDastanas_FC,ring1="Prolix ring", ring2="Kishar ring",
	back=gear.TaranusCape_FC,waist="Channeler's stone",legs="Psycloth lappas", feet=gear.merlinicCrackows_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole earring",waist="Siegel Sash"})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight cloak", head=empty})
	
	
    -- Precast sets to enhance JAs
	--sets.precast.JA['Intervene'] = {}

    
    -- Weaponskill sets
        
    sets.precast.WS['Myrkr'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+9%','CHR+2','Mag. Acc.+1','"Mag.Atk.Bns."+15',}},
    body="Amalric doublet",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','INT+1','"Mag.Atk.Bns."+7',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Etiolation Earring",
    left_ring="Etana Ring",
    right_ring="Prolix Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},}
		
	sets.precast.WS['Vidohunir'] = {ammo="Pemphredo tathlum",
        head="Pixie hairpin +1",neck="Fotia gorget",ear1="Regal earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Amalric gages +1",ring1="Archon Ring",ring2="Shiva Ring +1",
        back=gear.TaranusCape_MAB,waist="Fotia belt",legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
	
	sets.midcast['Elemental Magic'] = {ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Baetyl pendant",ear1="Regal earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Shiva Ring",ring2="Shiva ring +1",
        back=gear.TaranusCape_MAB,waist=gear.ElementalObi,legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MB, neck="Mizukage-no-Kubikazari",body=gear.merlinicJubbah_MB,hands="Amalric gages", 
	legs=gear.merlinicShalwar_MB, ring2="Mujin band", feet=gear.merlinicCrackows_MB})

	sets.midcast['Elemental Magic'].Forever = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's coat +2"})
	
	sets.midcast['Elemental Magic'].ForeverMB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MB, neck="Mizukage-no-Kubikazari",body="Spaekona's coat +2", 
	hands="Amalric gages", ring1="Mujin band", legs=gear.merlinicShalwar_MB,feet=gear.merlinicCrackows_MB})
	
    	
	sets.midcast.Comet = set_combine(sets.midcast['Elemental Magic'], {head="Pixie Hairpin +1", ring1="Archon Ring"})
	sets.midcast.Comet.MB = set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1", ring2="Archon Ring"})
		
	sets.midcast.Meteor = set_combine(sets.midcast['Elemental Magic'], {})
	
	sets.midcast.Death = set_combine(sets.midcast['Elemental Magic'], {head="Pixie Hairpin +1",ring2="Archon Ring"})
	sets.midcast.Death.MB = set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1",ring2="Archon Ring"})
	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	
	sets.midcast.FastRecast = {
		head=gear.merlinicHood_FC,neck="Incanter's torque",
		body=gear.merlinicJubbah_FC,hands=gear.merlinicDastanas_FC,ring2="Kishar ring",
		waist="Goading belt",legs="Assiduity pants +1",feet=gear.merlinicCrackows_FC}
		
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"})
	
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Incanter's torque",ear1="Gwati earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Etana ring",ring2="Kishar ring",
        back=gear.TaranusCape_MAB,waist="Luminary sash",legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
   
	sets.midcast['Healing Magic'] = set_combine(sets.midcast.FastRecast, {
		head=gear.telchineCap_ENH,neck="Incanter's torque",ear1="Regal earring",
		body="Heka's kalasiris",hands=gear.telchineGloves_ENH,
		back="Solemnity cape",waist="Luminary sash",legs=gear.telchineBraconi_ENH,feet="Medium's sabots"})

	sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast, {head="Appetence crown", neck="Erra pendant",ring1="Excelsis ring", ear2="Hirudinea earring", ring2="Evanescence ring", legs="Jhakri slops +2", feet=gear.merlinicCrackows_MB})
	    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo="Staunch tathlum",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Etiolation earring",
        body="Jhakri robe +2",hands=gear.merlinicDastanas_Ref,ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Herald's gaiters"}

	sets.idle.Refresh = {ammo="Staunch tathlum",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Lengo pants",feet="Mallquis clogs +2"}    
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Crier's gaiters"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged.Acc = {main="Laevateinn",
    sub="Alber Strap",
    ammo="Amar Cluster",
    head="Blistering Sallet +1",
    body="Jhakri robe +2",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+4','STR+9','Quadruple Attack +1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    legs={ name="Telchine Braconi", augments={'"Cure" potency +6%','Enh. Mag. eff. dur. +9',}},
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Goading Belt",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Rajas Ring",
    right_ring="Petrov Ring",
    back={ name="Taranus's Cape", augments={'MP+60','MP+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.engaged.STP = {}

	sets.engaged.PDT = {}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Yamabuki-no-obi"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Eschan stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
--function job_precast(spell, action, spellMap, eventArgs)
--    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
--        eventArgs.handled = true
--   end
    
--    if spell.skill == 'Healing Magic' then
--       gear.default.obi_back = "Mending Cape"
--    else
--        gear.default.obi_back = "Toro Cape"
--    end
--end


--function job_post_midcast(spell, action, spellMap, eventArgs)
--    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
--    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
--        equip(sets.buff['Divine Caress'])
--    end
--end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

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
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 8)
end
