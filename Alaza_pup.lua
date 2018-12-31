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

include('Alaza-Include.lua')


	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	send_command('alias fac input /equip ring2 "facility ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias ibu input /item "Ibushi Shinai" <me>; ')
	send_command('alias key input /item "Forbidden Key" <t>; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>') 
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Both', 'PetPDT', 'BothPDT')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PetMelee', 'PetPDT', 'BothPDT')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

	-- Debuffs ALT	
	send_command('bind !1 input /ja "Deploy" <t>')
	send_command('bind !2 input /ja "Retrieve" <me>')
	send_command('bind !3 input /ja "Repair" <me>; input /echo --REPAIR--')
	send_command('bind !4 input /ja "Maintenance" <me>; input /echo --MAINTENANCE--')
	send_command('bind !5 input /ja "Dawn Mulsum" <me>; input /echo --MULSUM--')
	send_command('bind !6 input /ma "Paralyna" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "invisible" <t>')
	send_command('bind !9 input /ma "invisible" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ja "Fire Maneuver" <me>; /echo --Fire--')
	send_command('bind ^2 input /ja "Wind Maneuver" <me>; /echo --Wind--')
	send_command('bind ^3 input /ja "Light Maneuver" <me>; /echo --Light--')
	send_command('bind ^4 input /ja "Earth Maneuver" <me>; /echo --Earth--')
	send_command('bind ^5 input /ja "Water Maneuver" <me>; /echo --Water--')
	send_command('bind ^6 input /ja "Dark Maneuver" <me>; /echo --Dark--')
	send_command('bind ^7 input /ja "Thunder Maneuver" <me>; /echo --Thunder--')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ma "sneak" <t>')
	send_command('bind ^0 input /ma "Refresh" <t>')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
	send_command('bind @F1 input /ma "poisona" <t>')
	send_command('bind @F2 input /ma "blindna" <t>')
	send_command('bind @F3 input /ma "silena" <t>')
	send_command('bind @F4 input /ma "stona" <t>')
	send_command('bind @F5 input /ma "viruna" <t>')
	send_command('bind @F6 input /ma "cursna" <t>')
	send_command('bind @F7 input /ma "Cure" <t>')
	send_command('bind @F8 input /ma "Cure II" <t>')
	send_command('bind @F9 input /ma "Cure V" <t>')
	send_command('bind @F10 input /item "Echo Drops" <me>')
	send_command('bind @F11 input /ma "sneak" <t>')
	send_command('bind @F12 input /ma "invisible" <t>')
	
    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Orunmila's Torque",ring1="Prolix ring", ring2="Veneficium ring",
	ear2="Loquacious Earring"}
        
    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    --sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Befouled crown"})

	--sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {neck="Diemer gorget", ear1="Nourishing earring +1"})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Ames",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
   
	sets.precast.JA['Overdrive'] = {body="Pitre tobe +1"}

	sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}
	
	sets.precast.JA['Activate'] = {back="Visucius's Mantle"}
	
	sets.precast.JA['Deus Ex Automata'] = {back="Visucius's Mantle"}

	sets.precast.JA['Repair'] = {
		main="Nibiru Sainti",
		ammo="Automat. Oil +3",ear1="Pratik earring", head="Rao kabuto", body="Rao togi",hands="Rao kote",
        legs="Rao haidate",feet="Rao sune-ate"}
		
	sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +3",ear1="Pratik earring"}

	sets.precast.JA.Maneuver = {neck="Buffoon's Collar +1", back="Visucius's mantle"}--body="Karagoz Farsetto +1",hands="Foire Dastanas +1"}

    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
        
    sets.precast.WS = {
        head=gear.herculeanHelm_Crit,neck="Fotia gorget",ear1="Odnowa Earring +1",ear2="Ishvara Earring",
        body="Rao togi",hands=gear.herculeanGloves_Pet,ring1="Cacoethic Ring +1",ring2="Apate Ring",
        back="Dispersal mantle",waist="Fotia Belt",legs=gear.herculeanTrousers_Pet,feet=gear.herculeanBoots_Pet}
    
	
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
		head=gear.herculeanHelm_Pet, neck="Shulmanu Collar", body="Pitre tobe +1", hands=gear.herculeanGloves_Pet, legs=gear.herculeanTrousers_Pet, 
		feet=gear.herculeanBoots_Pet}
	-- Sets to return to when not performing an action.
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {
        head="Rao kabuto",neck="Empath necklace",ear1="Odnowa earring +1",ear2="Odnowa earring",
        body="Rao togi",hands="Rao Kote",ring1="Sheltered ring",ring2="Defending Ring",
        back="Umbra Cape",waist="Klouskap Sash",legs="Rao haidate",feet="Hermes' sandals"}

    sets.idle.PetMelee = {
		main="Ohtas",
        head=gear.herculeanHelm_Pet,neck="Shulmanu Collar",ear1="Domesticator's earring",ear2="Enmerkar Earring",
        body="Pitre tobe +1",hands=gear.herculeanGloves_Pet,ring1="Varar ring",ring2="Varar ring",
        back="Visucius's mantle",waist="Klouskap Sash",legs=gear.herculeanTrousers_Pet,feet=gear.herculeanBoots_Pet} 

	sets.idle.PetPDT = {
		main="Midnights",
        head="Rao Kabuto",neck="Empath necklace",ear1="Rimeice earring",ear2="Enmerkar earring",
        body="Rao togi",hands="Rao kote",ring1="Varar ring",ring2="Varar ring",
        back="Visucius's mantle",waist="Isa Belt",legs="Rao haidate",feet="Rao sune-ate"}

	sets.idle.BothPDT = {
		main="Midnights",
        head="Rao Kabuto",neck="Loricate Torque +1",ear1="Rimeice earring",ear2="Enmerkar earring",
        body="Rao togi",hands="Rao kote",ring1="Vocane Ring",ring2="Defending Ring",
        back="Visucius's mantle",waist="Isa Belt",legs="Rao haidate",feet="Rao sune-ate"}

	sets.idle.PetRanged = {
		main="Ohtas",
        head="Ogier's helm",neck="Creed collar",ear1="Ethereal Earring",ear2="Loquacious earring",
        body="Twilight mail",hands="Ogier's gauntlets",ring1="Varar ring",ring2="Varar ring",
        back="Shadow Mantle",waist="Klouskap Sash",legs="Ogier's breeches",feet="Ogier's leggings"} 
		
	sets.idle.PetMagic = {
        head="Ogier's helm",neck="Creed collar",ear1="Ethereal Earring",ear2="Loquacious earring",
        body="Twilight mail",hands="Ogier's gauntlets",ring1="Varar ring",ring2="Varar ring",
        back="Shadow Mantle",waist="Klouskap Sash",legs="Ogier's breeches",feet="Ogier's leggings"}      
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Loricate Torque +1",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Loricate Torque +1",
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
        head=gear.herculeanHelm_Pet,neck="Empath necklace",ear1="Rimeice earring",ear2="Brutal earring",	
        body="Pitre tobe +1",hands=gear.herculeanGloves_Pet,ring1="Varar ring",ring2="Epona's ring",
        back="Visucius's mantle",waist="Klouskap Sash",legs=gear.herculeanTrousers_Pet,feet=gear.herculeanBoots_Pet}

	sets.engaged.Both = {
        head="Rao kabuto",neck="Empath necklace",ear1="Rimeice earring",ear2="Brutal earring",
        body="Pitre tobe +1",hands="Rao kote",ring1="Petrov ring",ring2="Epona's ring",
        back="Visucius's mantle",waist="Klouskap Sash",legs="Herculean trousers",feet="Herculean boots"}

	sets.engaged.PetPDT = {
        head="Rao kabuto",neck="Empath necklace",ear1="Handler's earring",ear2="Handler's earring +1",
        body="Rao togi",hands="Rao kote",ring1="Petrov ring",ring2="Epona's Ring",
        back="Visucius's mantle",waist="Klouskap Sash",legs="Rao haidate",feet="Rao sune-ate"}

	sets.engaged.BothPDT = {
        head="Rao kabuto",neck="Empath necklace",ear1="Handler's earring",ear2="Handler's earring +1",
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
    --set_macro_page(1, 6)
end
