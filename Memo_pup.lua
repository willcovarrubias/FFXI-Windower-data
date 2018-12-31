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

include('Memo-Include.lua')
send_command('alias craftgear input //gs equip sets.crafting')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Crit', 'PetPDT', 'BothPDT')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PetMelee', 'PetPDT', 'PetHybrid', 'PetMagic')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Baetyl Pendant",ring1="Rahab ring", ring2="Prolix ring",ear1="Etiolation earring",
	back="Swith cape +1",ear2="Enchanter earring +1"}
        
    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    --sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	--sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {neck="Diemer gorget", ear1="Nourishing earring +1"})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
   
	sets.precast.JA['Overdrive'] = {body="Pitre tobe +3"}

	sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}

	sets.precast.JA['Repair'] = {ammo="Automat. Oil +3",ear1="Pratik earring"}
	sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +3",ear1="Pratik earring"}

	sets.precast.JA.Maneuver = {neck="Buffoon's Collar +1"}--body="Karagoz Farsetto +1",hands="Foire Dastanas +1"}

    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
        
    sets.precast.WS = {
        head=gear.herculeanHelm_Crit,neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Rao togi",hands=gear.herculeanGloves_Pet,ring1="Regal ring",ring2="Begrudging Ring",
        back="Dispersal mantle",waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}
    
	
			-- Stringing Pummel = 32% STR / 32% VIT (Gravitation / Liquefaction)
			
	sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {})

			-- Victory Smite = 80% STR (Light / Fragmentation)
			
	sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {})

			
			-- Shijin Spiral = 73/85% DEX (Light / Fusion / Reverberation)
			
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
	

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
   
   -- Midcast sets for pet actions
	sets.midcast.Pet.Cure = {}--legs="Foire Churidars"}
	sets.midcast.Pet['Elemental Magic'] = {}--feet="Pitre Babouches +1"}
	sets.midcast.Pet.Weaponskill = {
		head=gear.herculeanHelm_Pet, body="Pitre tobe +3", hands=gear.herculeanGloves_Pet, legs=gear.herculeanTrousers_Pet, 
		feet=gear.herculeanBoots_Pet}
	-- Sets to return to when not performing an action.
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

	--('Idle', 'PetMelee', 'PetPDT', 'PetRanged')
    -- Idle sets
    sets.idle = {
        head="Rao kabuto",neck="Shulmanu collar",ear1="Odnowa earring +1",ear2="Genmei earring",
        body="Rao togi",hands="Rao kote",ring1="Defending ring",ring2="Vocane Ring",
        back="Solemnity cape",waist="Klouskap sash",legs="Rao haidate",feet="Hermes' sandals"}

    sets.idle.PetMelee = {
        head=gear.herculeanHelm_Pet,neck="Shulmanu collar",ear1="Enmerkar earring",ear2="Domesticator's earring",	
        body="Pitre tobe +3",hands=gear.herculeanGloves_Pet,ring1="Varar ring",ring2="Varar ring",
        back="Visucius's mantle",waist="Klouskap sash",legs=gear.herculeanTrousers_Pet,feet=gear.herculeanBoots_Pet}

	sets.idle.PetPDT = {	
        head="Rao Kabuto",neck="Loricate torque +1",ear1="Enmerkar earring",ear2="Odnowa earring +1",
        body="Rao togi",hands="Rao kote",ring1="Vocane ring",ring2="Defending Ring",
        back="Visucius's mantle",waist="Isa Belt",legs="Rao haidate",feet="Rao sune-ate"}

	sets.idle.PetHybrid = {	
        head="Anwig salade",neck="Shulmanu collar",ear1="Enmerkar earring",ear2="Rimeice earring",
        body="Pitre tobe +3",hands="Rao kote",ring1="Varar ring",ring2="Varar ring",
        back="Visucius's mantle",waist="Isa belt",legs=gear.herculeanTrousers_Pet,feet="Rao sune-ate"}  
		
	sets.idle.PetMagic = {	
        head="Rao Kabuto",neck="Shulmanu collar",ear1="Enmerkar earring",ear2="Rimeice earring",
        body="Pitre tobe +3",hands="Rao kote",ring1="Varar ring",ring2="Varar Ring",
        back="Visucius's mantle",waist="Klouskap sash",legs="Rao haidate",feet="Rao sune-ate"}   
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Hermes's sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
	--STP', 'Both', 'PetPDT', 'BothPDT'
    sets.engaged.STP = {
        head=gear.herculeanHelm_Pet,neck="Shulmanu collar",ear1="Telos earring",ear2="Brutal earring",	
        body="Pitre tobe +3",hands=gear.herculeanGloves_Pet,ring1="Petrov ring",ring2="Epona's ring",
        back="Visucius's mantle",waist="Klouskap sash",legs=gear.herculeanTrousers_Pet,feet=gear.herculeanBoots_Pet}

	sets.engaged.Crit = {
        head=gear.herculeanHelm_Crit,neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Rao togi",hands=gear.herculeanGloves_DT,ring1="Regal ring",ring2="Cacoethic ring +1",
        back="Visucius's mantle",waist="Windbuffet belt +1",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.engaged.PetPDT = {
        head="Rao kabuto",neck="Shulmanu collar",ear1="Enmerkar earring",ear2="Handler's earring +1",
        body="Rao togi",hands="Rao kote",ring1="Petrov ring",ring2="Epona's Ring",
        back="Visucius's mantle",waist="Klouskap sash",legs="Rao haidate",feet="Rao sune-ate"}

	sets.engaged.BothPDT = {
        head="Rao kabuto",neck="Shulmanu collar",ear1="Enmerkar earring",ear2="Handler's earring +1",
        body="Rao togi",hands="Rao kote",ring1="Eihwaz ring",ring2="Defending Ring",
        back="Visucius's mantle",waist="Flume belt +1",legs="Rao haidate",feet="Rao sune-ate"}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

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
    set_macro_page(1, 6)
end
